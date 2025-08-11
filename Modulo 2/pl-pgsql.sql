CREATE OR REPLACE FUNCTION func_auditoria() RETURNS TRIGGER AS $$
DECLARE
    v_usuario VARCHAR(50);  -- Variável para armazenar o usuário atual do banco
BEGIN
    -- Captura o nome do usuário que executa a operação no banco de dados
    v_usuario := current_user;

    -- DELETE
    IF TG_OP = 'DELETE' THEN
        INSERT INTO auditoria (tabela, operacao, usuario, dados_antigos)
        VALUES (
            TG_TABLE_NAME,       -- Nome da tabela onde ocorreu a operação
            TG_OP,               -- Tipo da operação (DELETE)
            v_usuario,           -- Usuário que realizou a operação
            row_to_json(OLD)     -- Dados antigos convertidos para JSON (registro excluído)
        );
        RETURN OLD;             -- Retorna o registro antigo para o fluxo do trigger


    -- UPDATE
    ELSIF TG_OP = 'UPDATE' THEN
        INSERT INTO auditoria (tabela, operacao, usuario, dados_antigos, dados_novos)
        VALUES (
            TG_TABLE_NAME,       -- Nome da tabela onde ocorreu a operação
            TG_OP,               -- Tipo da operação (UPDATE)
            v_usuario,           -- Usuário que realizou a operação
            row_to_json(OLD),    -- Dados antigos convertidos para JSON (antes da alteração)
            row_to_json(NEW)     -- Dados novos convertidos para JSON (após a alteração)
        );
        RETURN NEW;             -- Retorna o registro novo para o fluxo do trigger


    -- INSERT
    ELSIF TG_OP = 'INSERT' THEN
        INSERT INTO auditoria (tabela, operacao, usuario, dados_novos)
        VALUES (
            TG_TABLE_NAME,       -- Nome da tabela onde ocorreu a operação
            TG_OP,               -- Tipo da operação (INSERT)
            v_usuario,           -- Usuário que realizou a operação
            row_to_json(NEW)     -- Dados novos convertidos para JSON (registro inserido)
        );
        RETURN NEW;             -- Retorna o registro novo para o fluxo do trigger

    END IF;
END;
$$ LANGUAGE plpgsql;

-- Criando a Trigger para a tabela clientes
CREATE TRIGGER trg_auditar_clientes
AFTER INSERT OR UPDATE OR DELETE ON clientes
FOR EACH ROW
EXECUTE FUNCTION fn_auditar_clientes();
