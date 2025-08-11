# Questão 3 — Auditoria Completa com Triggers (PostgreSQL)

Este pacote contém scripts SQL prontos para implementar **auditoria de dados via triggers**,
registrando inserções, atualizações e exclusões com antes/depois em `jsonb`.

## Arquivos

1. **create-auditoria.sql** — Estrutura base  
   - Cria a tabela de domínio (ex.: `clientes`) e a tabela de auditoria `audit_log`.  
   - Define chaves e tipos necessários para rastreabilidade.

2. **func-auditoria.sql** — Função de trigger (genérica)  
   - Implementa a lógica de auditoria:
     - Captura `TG_OP` (`INSERT`, `UPDATE`, `DELETE`).
     - Salva `before_data` (OLD) e `after_data` (NEW) em `jsonb`.
     - Registra `tabela`, `row_id`, `changed_at` e `changed_by`.

3. **trigger-clientes.sql** — Associação das triggers  
   - Cria triggers `AFTER INSERT OR UPDATE OR DELETE` na tabela alvo (`clientes`)
     chamando a função de auditoria.  
   - (Opcional) Inclui um `BEFORE` de validação de regra de negócio, se necessário.

> Você pode reutilizar a mesma função de auditoria para outras tabelas — basta criar novas triggers nelas.