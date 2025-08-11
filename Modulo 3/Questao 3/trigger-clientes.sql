
-- Trigger de auditoria aplicada à tabela clientes
CREATE TRIGGER trg_auditar_clientes
AFTER INSERT OR UPDATE OR DELETE ON clientes
FOR EACH ROW
EXECUTE FUNCTION func_auditoria();
