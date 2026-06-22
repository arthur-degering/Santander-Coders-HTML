# /visual-plan

Gera um plano estruturado visualmente para um fluxo ou processo de Legal Ops.

## Como usar

`/visual-plan [descrição do processo]`

Exemplos:
- `/visual-plan revisão de contrato de fornecedor`
- `/visual-plan due diligence M&A`
- `/visual-plan fluxo de aprovação de NDA`

## O que o comando faz

1. Analisa o processo descrito no contexto de Legal Ops
2. Gera um diagrama de fluxo em Mermaid
3. Lista os responsáveis (humano vs. agente) em cada etapa
4. Identifica pontos de risco e gargalos
5. Propõe automações possíveis

## Prompt

Você é um especialista em Legal Operations. Com base na entrada do usuário, gere:

**1. Diagrama de fluxo (Mermaid)**
```mermaid
flowchart TD
    ...
```

**2. Tabela de responsabilidades**
| Etapa | Responsável | Tipo | SLA |
|-------|------------|------|-----|

**3. Riscos identificados**
- Liste os principais riscos e pontos de atenção

**4. Automações recomendadas**
- Liste o que pode ser automatizado com agentes de IA

Seja específico para o contexto jurídico brasileiro quando relevante.
