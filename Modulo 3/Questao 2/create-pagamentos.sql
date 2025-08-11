
-- Criação da tabela de pagamentos pendentes
CREATE TABLE pagamentos_pendentes (
    id SERIAL PRIMARY KEY,
    cliente_id INT,
    valor NUMERIC(10,2),
    status VARCHAR(20) DEFAULT 'pendente',
    data_criacao DATE NOT NULL,
    data_pagamento DATE
);
