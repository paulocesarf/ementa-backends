# Ementa Backends — Guia Mestre (README)

Documentação **refinada** e **estruturada** do repositório, organizada por módulos e pastas.
> **Observação:** Nenhum arquivo `.sql` ou `.py` foi alterado. Somente READMEs foram criados/atualizados.

---

## 📌 Objetivo
Este repositório compila exercícios e soluções de backend (principalmente **PostgreSQL** e **Python**) organizados por módulos.  
O foco é **clareza pedagógica** + **execução prática**. Cada pasta contém um **README próprio** com contexto, pré-requisitos e passos de execução.

---

## 🗂️ Estrutura do projeto
```
  - README.md
  - ementa_backend_python_com_links.pdf
- Modulo 1/
  - README.MD
  - main.py
- Modulo 2/
  - README.md
  - auditoria.sql
  - consulta-questao-2.sql
  - ecommerce.sql
  - pl-pgsql.sql
- Modulo 3/
  - Questao 1/
    - README.MD
    - sql/
      - create-vendas.sql
      - insert-vendas.sql
      - select-diferenca-venda.sql
      - select-media-model.sql
      - select-ranking-total.sql
      - select-ultima-vendas.sql
      - select-vendas-acumuladas.sql
  - Questao 2/
    - README.MD
    - sql/
      - create-pagamentos.sql
      - expirar-pagamentos.sql
  - Questao 3/
    - README.md
    - create-auditoria.sql
    - func-auditoria.sql
    - trigger-clientes.sql
  - Questao 4/
    - README.md
    - create-tabelas-loja.sql
    - otimizacoes-indexes.sql
    - query-lenta.sql
- Modulo 4/
  - Questao 4.txt
  - Quest╞o 1 e 2 e 3.txt
- Modulo 5/
  - Questao 1.txt
  - Questao 2.txt
  - Questao 3.txt
  - Questao 4.txt
```

---

## 🚀 Como usar
### Banco de Dados (PostgreSQL recomendado)
1. Crie um banco local (ex.: `ementa`).
2. Execute os scripts **na ordem indicada** nos READMEs por módulo (geralmente: `create_*` ➜ `insert_*` ➜ `select_*`).
3. Com `psql`:
   ```bash
   psql -U seu_usuario -d ementa -f caminho/do/arquivo.sql
   ```

### Python
1. Crie e ative um ambiente virtual:
   ```bash
   python -m venv .venv
   source .venv/bin/activate  # Linux/macOS
   .venv\Scripts\activate   # Windows
   ```
2. Execute o script desejado:
   ```bash
   python main.py
   ```

---

## 📚 Conteúdo por Módulo (visão geral)
- **Módulo 1** — Rotinas em Python e fundamentos (ex.: cache LRU com TTL).  
- **Módulo 2** — Modelagem de dados, DDL/DML, PL/pgSQL e consultas variadas.  
- **Módulo 3** — Casos práticos por questão: vendas, pagamentos, auditoria com triggers, otimização.  
- **Módulo 4** — Resoluções discursivas (TXT) agregando raciocínio de modelagem e SQL.  
- **Módulo 5** — Estudos de caso/questões com respostas em TXT.

> Para detalhes, veja o README de cada pasta.

---

## 📎 Referências e material de apoio
- `ementa_backend_python_com_links.pdf` (na raiz): material com links e referências.

---

## 🤝 Contribuição
1. Abra uma branch de trabalho.
2. Atualize apenas os READMEs ou adicione novos arquivos de documentação.
3. Não altere `.sql` e `.py` existentes sem alinhamento prévio.
4. Crie PR descrevendo mudanças e decisões.

---

## 🧪 Boas práticas
- Scripts SQL: mantenha comentários sobre suposições de negócios e versões de schema.
- Funções/Triggers: documente entradas/saídas e efeitos colaterais.
- Python: descreva dependências e parâmetros.
- Organize os datasets de exemplo (quando aplicável) e a ordem de execução.

---

## 🛠️ Ambiente sugerido
- **PostgreSQL ≥ 13**
- **psql** disponível no PATH
- **Python ≥ 3.10**

---

## 📄 Licença
Defina a licença do repositório conforme necessário (ex.: MIT).

