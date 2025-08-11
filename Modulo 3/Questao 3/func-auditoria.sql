# Questão 3 — Auditoria Completa com Triggers

Este pacote implementa **auditoria de dados via triggers**, registrando inserções, atualizações e exclusões em uma tabela `auditoria`, com os estados **antes** e **depois** em `JSONB`.

## Arquivos

1. **create-auditoria.sql** — Estrutura da tabela de auditoria  
   Cria a tabela `auditoria` com as colunas:  
   `id`, `tabela`, `operacao`, `usuario`, `data_operacao`, `dados_antigos`, `dados_novos`. 

2. **func-auditoria.sql** — Função de trigger (genérica)  
   Define `func_auditoria()` para capturar `INSERT/UPDATE/DELETE` e gravar em `auditoria`:  
   - `DELETE`: salva `dados_antigos` (linha OLD).  
   - `UPDATE`: salva `dados_antigos` e `dados_novos`.  
   - `INSERT`: salva `dados_novos`.  
   O usuário é obtido de `current_user`. 

3. **trigger-clientes.sql** — Associação da trigger  
   Cria a trigger `trg_auditar_clientes` **AFTER INSERT OR UPDATE OR DELETE** na tabela `clientes`, apontando para `func_auditoria()`. (A tabela `clientes` deve existir previamente.) 

> **Reuso:** para auditar outras tabelas, crie novas triggers nelas reutilizando `func_auditoria()`.