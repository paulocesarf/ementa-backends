# Relatórios com Window Functions

Este pacote contém 3 relatórios SQL prontos para uso, cada um em um arquivo separado,
utilizando **funções de janela** para calcular métricas linha a linha sem perder o detalhe.

## Arquivos

1. **movel-vendedor.sql** — Média móvel de 3 vendas por vendedor
   - Calcula a média da venda atual e das 2 anteriores, por vendedor.
   - Útil para suavizar flutuações e analisar tendências.

2. **ranking-vendedor.sql** — Ranking mensal por vendedor
   - Calcula o total do mês por vendedor e gera rankings (`RANK`, `DENSE_RANK`, `ROW_NUMBER`).
   - Permite identificar líderes e evolução mensal.

3. **acumulado-vendedor.sql** — Total acumulado por vendedor
   - Soma progressiva das vendas por vendedor ao longo do tempo.
   - Útil para acompanhar performance acumulada.

> Se houver múltiplas vendas no mesmo dia para o mesmo vendedor, adicione uma coluna `id` para ordenar sem ambiguidade.

## Saída esperada
Cada script retorna colunas originais (`vendedor`, `data`, `valor`) mais a métrica calculada.