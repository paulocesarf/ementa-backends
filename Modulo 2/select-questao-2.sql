-- A query lista os 10 produtos mais vendidos entre janeiro e junho de 2025 em pedidos finalizados, mostrando o nome do produto, sua categoria e a quantidade total vendida no período.
SELECT 
    p.nome,                     -- Nome do produto
    c.nome AS categoria,        -- Nome da categoria do produto
    SUM(pi.quantidade) AS total_vendido  -- Soma total da quantidade vendida do produto
FROM 
    produtos p
    JOIN categorias c ON p.categoria_id = c.id  -- Relaciona cada produto com sua categoria
    JOIN pedido_itens pi ON p.id = pi.produto_id  -- Relaciona os itens do pedido ao produto
    JOIN pedidos pe ON pi.pedido_id = pe.id  -- Relaciona os itens ao pedido
WHERE 
    pe.status = 'CONCLUIDO'  -- Apenas Concluidos
    AND pe.data_pedido BETWEEN '2025-01-01' AND '2025-06-30'  -- Filtra pedidos entre 01/01/2025 e 30/06/2025
GROUP BY 
    p.id,       -- Agrupa os resultados por produto
    c.nome      -- Agrupa por categoria
ORDER BY 
    total_vendido DESC  -- Ordem decrescente
LIMIT 10;  -- Limita o resultado aos 10 produtos
