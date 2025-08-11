-- Soma acumulada (running total) por vendedor em ordem cronológica
SELECT
  vendedor,
  data,
  valor,
  SUM(valor) OVER (
    PARTITION BY vendedor
    ORDER BY data
    ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
  ) AS acumulado_vendedor
FROM vendas
ORDER BY vendedor, data;
