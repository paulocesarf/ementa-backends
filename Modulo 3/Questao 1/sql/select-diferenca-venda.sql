-- Diferença para a venda anterior
SELECT 
    vendedor,
    data,
    valor,
    valor - LAG(valor) OVER (PARTITION BY vendedor ORDER BY data) AS diferenca_anterior
FROM vendas;
