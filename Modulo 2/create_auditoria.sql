
--Essa tabela vai registrar operações (INSERT, UPDATE, DELETE)
CREATE TABLE auditoria (
    id SERIAL PRIMARY KEY,
    tabela VARCHAR(50) NOT NULL,          -- Nome da tabela
    operacao VARCHAR(10) NOT NULL,        -- INSERT, UPDATE, DELETE
    usuario VARCHAR(50),                   -- Usuário que realizou a operação
    data_operacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  -- Data da operação
    dados_antigos JSONB,                   -- Dados antes da alteração
    dados_novos JSONB                     -- Dados após a alteração
);
