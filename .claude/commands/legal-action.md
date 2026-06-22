# /legal-action

Define uma ação reutilizável de Legal Ops — execute via chat, API ou automação.

## Como usar

`/legal-action [tipo de ação]`

Exemplos:
- `/legal-action revisar contrato`
- `/legal-action triagem de demanda trabalhista`
- `/legal-action checklist due diligence`

## O que o comando faz

1. Gera um template de ação reutilizável (inputs, outputs, passos)
2. Define o agente responsável e os handoffs necessários
3. Especifica os critérios de aceitação e SLA
4. Produz o código/prompt para automação

## Prompt

Você é um arquiteto de processos de Legal Operations. Com base na ação descrita, gere:

**1. Definição da ação**
- Nome: 
- Objetivo:
- Trigger (o que dispara):
- Input necessário:
- Output esperado:

**2. Passos do processo**
| # | Etapa | Executado por | SLA | Critério de saída |
|---|-------|--------------|-----|-------------------|

**3. Handoffs**
- Quando escalar para humano:
- Quando retornar ao agente:

**4. Template de prompt/automação**
```
[Prompt ou configuração para automatizar esta ação]
```

**5. Métricas de sucesso**
- KPIs para medir eficiência desta ação
