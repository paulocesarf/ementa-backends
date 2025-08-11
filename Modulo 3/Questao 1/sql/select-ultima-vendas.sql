-- Última venda por vendedor
SELECT *
FROM (
    SELECT 
        vendedor,
        data,
        valor,
        ROW_NUMBER() OVER (PARTITION BY vendedor ORDER BY data DESC) AS rn
    FROM vendas
) sub
WHERE rn = 1;
