# Projeto: Expiração de Pagamentos Pendentes

Simulação de uma tabela de pagamentos com lógica de expiração automática via stored procedure.

## Tabela

- `pagamentos_pendentes`: armazena cliente, valor, status e datas de criação/pagamento.

## Lógica de Expiração

A procedure `atualizar_pagamentos_expirados()` marca como "expirado" os pagamentos:

- Que continuam com status "pendente"
- Foram criados há mais de 7 dias
- E que não têm `data_pagamento` definida