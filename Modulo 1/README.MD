# Módulo 1 — Python e Fundamentos

Exercícios introdutórios em Python aplicados ao backend. Inclui exemplos como **cache LRU com TTL**, manipulação de dados e boas práticas de scripts executáveis.

---

## 📂 Subpastas
_(sem subpastas)_

---

## 📜 Sumário de scripts
| Arquivo | Propósito |
|---|---|
| `README.MD` | Documentação local do módulo. |
| `main.py` | Script Python executável (ver instruções abaixo). |

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

### 💡 Notas
- Ajuste parâmetros diretamente no código quando aplicável.
- Se houver dependências, documente-as no topo do arquivo.
