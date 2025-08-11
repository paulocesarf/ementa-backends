
-- Média móvel
SELECT 
    vendedor,
    data,
    valor,
    AVG(valor) OVER (
        PARTITION BY vendedor 
        ORDER BY data 
        ROWS BETWEEN 1 PRECEDING AND CURRENT ROW
    ) AS media_movel
FROM vendas;
