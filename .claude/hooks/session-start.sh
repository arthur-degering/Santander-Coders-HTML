#!/bin/bash
set -euo pipefail

# Only run in remote (web) environments
if [ "${CLAUDE_CODE_REMOTE:-}" != "true" ]; then
  exit 0
fi

DEBIAN_FRONTEND=noninteractive

# --------------------------------------------------------------------------
# 1. Desktop environment — XFCE4 (available via Ubuntu repos)
# --------------------------------------------------------------------------
if ! dpkg -l xfce4 &>/dev/null; then
  echo "[session-start] Installing XFCE4 desktop environment..."
  apt-get update -qq
  apt-get install -y --no-install-recommends \
    xfce4 \
    xfce4-terminal \
    dbus-x11 \
    x11-utils \
    xvfb
fi

# --------------------------------------------------------------------------
# 2. Chrome Remote Desktop (requires dl.google.com to be accessible)
# --------------------------------------------------------------------------
install_chrome_remote_desktop() {
  local DEB="/tmp/chrome-remote-desktop.deb"

  echo "[session-start] Downloading Chrome Remote Desktop..."
  if ! curl -fsSL --cacert /root/.ccr/ca-bundle.crt \
      "https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb" \
      -o "$DEB"; then
    echo "[session-start] WARNING: Could not reach dl.google.com." \
         "Chrome Remote Desktop will NOT be installed." \
         "Enable unrestricted network access for this session and retry."
    return 1
  fi

  echo "[session-start] Installing Chrome Remote Desktop..."
  apt-get install -y --no-install-recommends "$DEB" 2>/dev/null || \
    dpkg -i "$DEB" && apt-get install -f -y
  rm -f "$DEB"
  echo "[session-start] Chrome Remote Desktop installed successfully."
}

if ! command -v chrome-remote-desktop &>/dev/null; then
  install_chrome_remote_desktop || true
fi

# --------------------------------------------------------------------------
# 3. Configure desktop session for Chrome Remote Desktop
# --------------------------------------------------------------------------
CHROME_REMOTE_DESKTOP_SESSION_FILE="$HOME/.chrome-remote-desktop-session"
if command -v chrome-remote-desktop &>/dev/null && \
   [ ! -f "$CHROME_REMOTE_DESKTOP_SESSION_FILE" ]; then
  echo "[session-start] Configuring desktop session..."
  cat > "$CHROME_REMOTE_DESKTOP_SESSION_FILE" << 'SESSION'
#!/bin/bash
export XDG_SESSION_TYPE=x11
export XDG_CURRENT_DESKTOP=XFCE
export XDG_SESSION_DESKTOP=xfce
exec startxfce4
SESSION
  chmod +x "$CHROME_REMOTE_DESKTOP_SESSION_FILE"
fi

# --------------------------------------------------------------------------
# 4. Start Xvfb virtual display (display :20) if not already running
#    Used both as fallback display and by Chrome Remote Desktop
# --------------------------------------------------------------------------
if ! pgrep -x Xvfb &>/dev/null; then
  echo "[session-start] Starting Xvfb virtual display on :20..."
  Xvfb :20 -screen 0 1920x1080x24 -ac +extension GLX &>/dev/null &
  sleep 1
fi

export DISPLAY=":20"
if [ -n "${CLAUDE_ENV_FILE:-}" ]; then
  echo 'export DISPLAY=":20"' >> "$CLAUDE_ENV_FILE"
fi

echo "[session-start] Remote desktop environment ready."
echo "[session-start] DISPLAY=$DISPLAY"
if command -v chrome-remote-desktop &>/dev/null; then
  echo "[session-start] Chrome Remote Desktop is installed."
  echo "[session-start] Authorize at: https://remotedesktop.google.com/headless"
else
  echo "[session-start] Chrome Remote Desktop NOT installed (dl.google.com blocked)."
  echo "[session-start] Xvfb display :20 is available for headless browser testing."
fi
