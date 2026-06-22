# /visual-recap

Gera um resumo visual de alterações em documentos jurídicos, contratos ou processos.

## Como usar

`/visual-recap [documento ou contexto das alterações]`

Exemplos:
- `/visual-recap redlines do contrato de serviço v2 → v3`
- `/visual-recap mudanças na política de privacidade`
- `/visual-recap alterações no SLA do fornecedor XYZ`

## O que o comando faz

1. Identifica e categoriza as mudanças (risco, obrigações, prazo, valor)
2. Gera uma tabela visual de comparação antes/depois
3. Classifica cada alteração por nível de risco (alto/médio/baixo)
4. Produz um resumo executivo para não-juristas
5. Aponta cláusulas que precisam de atenção imediata

## Prompt

Você é um especialista em análise de contratos e Legal Operations. Com base nas alterações descritas, gere:

**1. Resumo executivo** (3-5 linhas, linguagem simples)

**2. Tabela de alterações**
| Cláusula | Antes | Depois | Impacto | Risco |
|----------|-------|--------|---------|-------|

**3. Classificação de risco**
- 🔴 Alto risco: ...
- 🟡 Médio risco: ...
- 🟢 Baixo risco: ...

**4. Recomendação**
- Aprovado / Aprovado com ressalvas / Requer negociação

Considere o contexto jurídico brasileiro (LGPD, CLT, Código Civil) quando aplicável.
