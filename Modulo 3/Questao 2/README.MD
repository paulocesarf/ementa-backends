# Expiração de Pagamentos

Este pacote contém 2 scripts SQL prontos para uso, cada um em um arquivo separado, utilizando **procedures** para processar registros em lote e atualizar automaticamente o status de pagamentos pendentes que passaram do prazo.

## Arquivos

1. **create-pagamentos.sql** — Criação da tabela de pagamentos pendentes  
   - Define a estrutura da tabela `pagamentos_pendentes` com campos para cliente, valor, status e datas de criação/pagamento.  
   - Inclui valores padrão e restrições básicas para consistência dos dados.

2. **expirar-pagamentos.sql** — Procedure de expiração e execução  
   - Cria a procedure `atualizar_pagamentos_expirados()` que:
     - Atualiza registros com status **pendente** para **expirado**.
     - Considera apenas registros com mais de 7 dias de criação e sem data de pagamento.
     - Informa no console a quantidade de registros afetados.
   - Executa a procedure para aplicar as alterações.

> Para testes, insira alguns registros com datas variadas e status pendente para verificar quais serão expirados.

## Saída esperada
Após a execução:
- Registros que atendem aos critérios terão `status = 'expirado'`.
- Os demais permanecerão inalterados.
- Será exibida uma mensagem no console indicando o número de registros atualizados.