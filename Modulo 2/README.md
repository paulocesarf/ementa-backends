# Módulo 2 — SQL, PL/pgSQL e Auditoria

Modelagem e consultas SQL, **PL/pgSQL**, criação de objetos, e scripts de auditoria. Foco em e-commerce e rotinas de negócios.

---

## 📂 Subpastas
_(sem subpastas)_

---

## 📜 Sumário de scripts
| Arquivo | Propósito |
|---|---|
| `README.md` | Documentação local do módulo. |
| `auditoria.sql` | Estruturas e lógica de auditoria. |
| `consulta-questao-2.sql` | Script SQL com objetivo específico (ver comentários do arquivo). |
| `ecommerce.sql` | Modelo base de e-commerce (tabelas/relacionamentos). |
| `pl-pgsql.sql` | Funções/procedures em PL/pgSQL. |

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


