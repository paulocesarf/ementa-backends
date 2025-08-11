-- Tabela categorias
CREATE TABLE categorias (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL UNIQUE
);

-- Tabela produtos
CREATE TABLE produtos (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    descricao TEXT,
    preco NUMERIC(10,2) NOT NULL CHECK (preco >= 0),
    categoria_id INT NOT NULL,
    CONSTRAINT fk_categoria FOREIGN KEY (categoria_id) REFERENCES categorias(id)
);

-- Tabela clientes
CREATE TABLE clientes (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    telefone VARCHAR(20),
    cpf VARCHAR(14) UNIQUE NOT NULL,
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela endereços
CREATE TABLE enderecos (
    id SERIAL PRIMARY KEY,
    cliente_id INT NOT NULL,
    rua VARCHAR(255) NOT NULL,
    numero VARCHAR(10) NOT NULL,
    complemento VARCHAR(100),
    bairro VARCHAR(100),
    cidade VARCHAR(100) NOT NULL,
    estado CHAR(2) NOT NULL,
    cep VARCHAR(9) NOT NULL,
    CONSTRAINT fk_cliente_endereco FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

-- Tabela pedidos
CREATE TABLE pedidos (
    id SERIAL PRIMARY KEY,
    cliente_id INT NOT NULL,
    data_pedido TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(20) NOT NULL DEFAULT 'PENDENTE',
    CONSTRAINT fk_cliente_pedido FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

-- Tabela itens do pedido
CREATE TABLE pedido_itens (
    id SERIAL PRIMARY KEY,
    pedido_id INT NOT NULL,
    produto_id INT NOT NULL,
    quantidade INT NOT NULL CHECK (quantidade > 0),
    preco_unitario NUMERIC(10,2) NOT NULL CHECK (preco_unitario >= 0),
    CONSTRAINT fk_pedido FOREIGN KEY (pedido_id) REFERENCES pedidos(id),
    CONSTRAINT fk_produto FOREIGN KEY (produto_id) REFERENCES produtos(id)
);

-- Tabela pagamentos
CREATE TABLE pagamentos (
    id SERIAL PRIMARY KEY,
    pedido_id INT NOT NULL,
    data_pagamento TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    valor_pago NUMERIC(10,2) NOT NULL CHECK (valor_pago >= 0),
    metodo_pagamento VARCHAR(50) NOT NULL,
    status_pagamento VARCHAR(20) NOT NULL DEFAULT 'PENDENTE',
    CONSTRAINT fk_pedido_pagamento FOREIGN KEY (pedido_id) REFERENCES pedidos(id)
);

-- Tabela estoque
CREATE TABLE estoque (
    produto_id INT PRIMARY KEY,
    quantidade_disponivel INT NOT NULL CHECK (quantidade_disponivel >= 0),
    CONSTRAINT fk_produto_estoque FOREIGN KEY (produto_id) REFERENCES produtos(id)
);
