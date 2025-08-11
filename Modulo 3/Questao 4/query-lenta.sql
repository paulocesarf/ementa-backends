
-- Consulta lenta de exemplo
SELECT
    c.nome AS cliente,
    p.data_pedido,
    pr.nome AS produto,
    ip.quantidade,
    ip.preco_unitario,
    ip.quantidade * ip.preco_unitario AS total_item
FROM pedidos p
JOIN clientes c ON p.cliente_id = c.id
JOIN itens_pedido ip ON ip.pedido_id = p.id
JOIN produtos pr ON pr.id = ip.produto_id
WHERE p.data_pedido BETWEEN '2023-01-01' AND '2023-12-31'
  AND pr.categoria = 'Eletrônicos'
  AND c.cidade = 'São Paulo'
ORDER BY p.data_pedido DESC;
