# Projeto: Análises de Vendas com SQL

Este projeto simula registros de vendas em uma tabela relacional e aplica consultas SQL avançadas (ranking, média móvel, acumulado, etc.) usando funções de janela (window functions) no PostgreSQL.

## Estrutura

- `create-vendas.sql`: Criação da tabela `vendas`
- `insert-vendas.sql`: Inserção de dados de exemplo
- `select-ranking-total.sql`: Ranking dos vendedores por total vendido
- `select-vendas-acumuladas.sql`: Vendas acumuladas por vendedor
- `select-media-model.sql`: Média móvel (rolling average)
- `select-ultima-vendas.sql`: Última venda de cada vendedor
- `select-diferenca-venda.sql`: Diferença entre vendas consecutivas

## Conceitos Aplicados

- Window Functions: `RANK()`, `SUM() OVER`, `AVG() OVER`, `LAG()`
- Subqueries com `ROW_NUMBER()`
- Particionamento com `PARTITION BY`
- Ordenações temporais com `ORDER BY`
