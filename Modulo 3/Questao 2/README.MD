# Questão 2 — Pagamentos

Modelo de **pagamentos** e rotina de **expiração** de pagamentos (status).

---

## 📂 Subpastas
- `sql/`

---

## 📜 Sumário de scripts
| Arquivo | Propósito |
|---|---|
| `README.MD` | Documentação local do módulo. |

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


