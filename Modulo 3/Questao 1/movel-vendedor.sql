-- Média móvel das últimas 3 vendas por vendedor
SELECT
  vendedor,
  data,
  valor,
  AVG(valor) OVER (
    PARTITION BY vendedor
    ORDER BY data
    ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
  ) AS media_movel_3
FROM vendas
ORDER BY vendedor, data;
