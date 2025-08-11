# Questão 3 — Auditoria com Trigger

Implementação de **auditoria** em alterações de clientes com **função** e **trigger**.

---

## 📂 Subpastas
_(sem subpastas)_

---

## 📜 Sumário de scripts
| Arquivo | Propósito |
|---|---|
| `README.md` | Documentação local do módulo. |
| `create-auditoria.sql` | Criação/DDL das tabelas ou objetos de banco. / Estruturas e lógica de auditoria. |
| `func-auditoria.sql` | Função/Stored Procedure (PL/pgSQL). / Estruturas e lógica de auditoria. |
| `trigger-clientes.sql` | Trigger para auditoria/consistência. |

---

## ▶️ Execução
### Banco de Dados (PostgreSQL)
1. Crie o banco e rode **nesta ordem** quando existir: `create_*` ➜ `insert_*` ➜ `select_*`.
2. Use `psql`:
   ```bash
   psql -U seu_usuario -d ementa -f caminho/do/arquivo.sql
   ```

### Python
```bash
python -m venv .venv
source .venv/bin/activate  # Linux/macOS
.venv\Scripts\activate   # Windows
python main.py
```

---


