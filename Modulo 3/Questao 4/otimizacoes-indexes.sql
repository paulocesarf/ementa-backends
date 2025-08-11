
-- Índices para otimização de performance

CREATE INDEX idx_pedidos_data ON pedidos (data_pedido);
CREATE INDEX idx_clientes_cidade ON clientes (cidade);
CREATE INDEX idx_produtos_categoria ON produtos (categoria);
CREATE INDEX idx_pedidos_cliente_id ON pedidos (cliente_id);
CREATE INDEX idx_itens_pedido_pedido_id ON itens_pedido (pedido_id);
CREATE INDEX idx_itens_pedido_produto_id ON itens_pedido (produto_id);
