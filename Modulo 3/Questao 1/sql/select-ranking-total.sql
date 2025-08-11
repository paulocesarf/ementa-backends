
-- Ranking por total de vendas
SELECT 
    vendedor,
    SUM(valor) AS total_vendas,
    RANK() OVER (ORDER BY SUM(valor) DESC) AS ranking
FROM vendas
GROUP BY vendedor;
