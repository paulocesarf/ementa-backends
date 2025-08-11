## Criar Tabela de Auditoria

**Arquivo:** `create-auditoria.sql`

Cria a tabela `auditoria` para registrar operações realizadas em tabelas sensíveis, como `INSERT`, `UPDATE` e `DELETE`. Os dados antigos e novos são armazenados em formato JSONB, junto com o nome da tabela, usuário e data da operação.

## Função de Auditoria

**Arquivo:** `func-auditoria.sql`

Define a função `func_auditoria()` que será executada automaticamente pelas triggers. Ela detecta o tipo de operação (INSERT, UPDATE ou DELETE) e insere o registro correspondente na tabela `auditoria`.

## Trigger de Auditoria

**Arquivo:** `trigger-clientes.sql`

Aplica a trigger `trg_auditar_clientes` à tabela `clientes`, para que todas as alterações feitas nessa tabela sejam registradas automaticamente pela função de auditoria.

## README

1. Execute o script `create-auditoria.sql` para criar a tabela de auditoria
2. Execute o script `func-auditoria.sql` para registrar a função responsável pela lógica
3. Execute o script `trigger-clientes.sql` para ativar a auditoria na tabela `clientes`

Você pode replicar o script de trigger para qualquer tabela que deseje auditar, alterando apenas o nome da tabela.

## Arquivos do Projeto

`create-auditoria.sql`   - Criação da tabela `auditoria`  
`func-auditoria.sql`     - Função `func_auditoria()` com a lógica de registro  
`trigger-clientes.sql`   - Trigger de auditoria aplicada à tabela `clientes`  
