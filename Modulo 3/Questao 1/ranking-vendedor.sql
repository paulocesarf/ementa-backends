-- Ranking mensal de vendedores por faturamento no mês
WITH por_mes AS (
  SELECT vendedor, date_trunc('month', data)::date AS mes, SUM(valor) AS total_mes
  FROM vendas
  GROUP BY vendedor, date_trunc('month', data)
)
SELECT
  vendedor,
  mes,
  total_mes,
  RANK()        OVER (PARTITION BY mes ORDER BY total_mes DESC) AS posicao_rank,
  DENSE_RANK()  OVER (PARTITION BY mes ORDER BY total_mes DESC) AS posicao_dense,
  ROW_NUMBER()  OVER (PARTITION BY mes ORDER BY total_mes DESC) AS linha_ordenada
FROM por_mes
ORDER BY mes DESC, posicao_rank, vendedor;
