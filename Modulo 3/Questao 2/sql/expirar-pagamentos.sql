-- 2. Procedure para atualizar pagamentos expirados
CREATE OR REPLACE PROCEDURE atualizar_pagamentos_expirados()
LANGUAGE plpgsql
AS $$
DECLARE
    registros_atualizados INT;
BEGIN
    UPDATE pagamentos_pendentes
    SET status = 'expirado'
    WHERE status = 'pendente'
      AND data_criacao <= CURRENT_DATE - INTERVAL '7 days'
      AND (data_pagamento IS NULL OR data_pagamento = '');

    GET DIAGNOSTICS registros_atualizados = ROW_COUNT;

    RAISE NOTICE 'Pagamentos expirados atualizados: %', registros_atualizados;
END;
$$;

-- 3. Execução da procedure
CALL atualizar_pagamentos_expirados();