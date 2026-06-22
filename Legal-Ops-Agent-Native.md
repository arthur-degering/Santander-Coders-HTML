# Agent-Native — Análise de Skills para Legal Ops

**Data:** 2026-06-22  
**Fonte:** [BuilderIO/agent-native](https://github.com/BuilderIO/agent-native)  
**Contexto:** Reel Instagram avaliando skills de IA para aplicação em Legal Operations

---

## O que é o Agent-Native

Framework open-source para construir aplicações nativas de agentes de IA. Permite definir **Actions** uma única vez e utilizá-las via UI, agente, API, MCP, A2A e CLI.

---

## Skills Avaliadas x Legal Ops

### Fazem muito sentido

| Skill | Aplicação em Legal Ops |
|-------|------------------------|
| **Actions** (define uma vez, usa em qualquer canal) | Fluxos de revisão de contrato, checklists de due diligence e aprovações reutilizáveis em qualquer interface |
| **Memória de agente + Jobs assíncronos** | Monitoramento de prazos contratuais, alertas de renovação, compliance contínuo |
| **Multiplayer** (humano + agente no mesmo doc) | Revisão colaborativa de contratos entre advogados, cliente e agente simultaneamente |
| **Observabilidade + Handoffs entre agentes** | Audit trail jurídico e escalonamento entre agentes especializados (ex: contratos → litígios) |
| **Templates: Plans, Calendar, Analytics** | Gestão de matters, controle de prazos processuais, dashboards de legal spend |

### Fazem sentido com adaptação

| Skill | Observação |
|-------|------------|
| **/visual-plan** | Excelente para mapear fluxos jurídicos; precisa de templates específicos para Legal |
| **/visual-recap** | Pode funcionar como resumo de redlines; requer integração com Word/PDF |
| **Comunicação A2A** | Orquestração de agentes especializados (compliance, KYC, contratos); complexo de implementar |

### Fazem menos sentido

| Skill | Motivo |
|-------|--------|
| **Templates: Slides, Clips** | Periféricos para Legal Ops — mais voltados a marketing |
| **Auto-melhoria de features/bugs** | Recurso de dev de software, sem aplicação direta em Legal |

---

## Skills Instaladas no Claude Code

Três slash commands criados em `.claude/commands/`:

### `/visual-plan`
Gera plano visual (diagrama Mermaid + tabela de responsáveis + riscos) para fluxos de Legal Ops.

**Uso:** `/visual-plan revisão de contrato de fornecedor`

### `/visual-recap`  
Resume alterações em documentos jurídicos com tabela antes/depois, classificação de risco e recomendação.

**Uso:** `/visual-recap redlines do contrato v2 → v3`

### `/legal-action`
Define ações reutilizáveis de Legal Ops com inputs, outputs, handoffs e template de automação.

**Uso:** `/legal-action triagem de demanda trabalhista`

---

## Conclusão

O agent-native oferece infraestrutura sólida de agentes aplicável a Legal Ops, especialmente para **automação de fluxos, colaboração humano-IA em documentos e rastreabilidade**. O gap principal é a ausência de templates verticalizados para Legal — que precisam ser construídos em cima da base.

**Próximos passos sugeridos:**
- [ ] Testar `/visual-plan` com um fluxo de aprovação de contrato real
- [ ] Avaliar integração do agent-native com ferramentas de CLM (Contract Lifecycle Management)
- [ ] Mapear casos de uso prioritários de automação no time jurídico

---

## Tags
`#legal-ops` `#ia` `#automação` `#contratos` `#agent-native` `#claude-code`
