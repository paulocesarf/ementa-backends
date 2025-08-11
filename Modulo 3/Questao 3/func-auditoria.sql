
-- Função de auditoria para registrar alterações
CREATE OR REPLACE FUNCTION func_auditoria() RETURNS TRIGGER AS $$
DECLARE
    v_usuario VARCHAR(50);
BEGIN
    v_usuario := current_user;

    IF TG_OP = 'DELETE' THEN
        INSERT INTO auditoria (tabela, operacao, usuario, dados_antigos)
        VALUES (TG_TABLE_NAME, TG_OP, v_usuario, row_to_json(OLD));
        RETURN OLD;

    ELSIF TG_OP = 'UPDATE' THEN
        INSERT INTO auditoria (tabela, operacao, usuario, dados_antigos, dados_novos)
        VALUES (TG_TABLE_NAME, TG_OP, v_usuario, row_to_json(OLD), row_to_json(NEW));
        RETURN NEW;

    ELSIF TG_OP = 'INSERT' THEN
        INSERT INTO auditoria (tabela, operacao, usuario, dados_novos)
        VALUES (TG_TABLE_NAME, TG_OP, v_usuario, row_to_json(NEW));
        RETURN NEW;
    END IF;
END;
$$ LANGUAGE plpgsql;
