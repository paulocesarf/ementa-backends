
-- Vendas acumuladas
SELECT 
    vendedor,
    data,
    valor,
    SUM(valor) OVER (
        PARTITION BY vendedor 
        ORDER BY data
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS acumulado
FROM vendas;

