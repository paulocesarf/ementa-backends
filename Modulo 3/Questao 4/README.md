# Questão 4 — Otimização de Queries com Planos de Execução (PostgreSQL)

Este pacote mostra como **diagnosticar** e **acelerar** uma consulta lenta usando:
- `EXPLAIN (ANALYZE, BUFFERS)` para entender o plano,
- criação de **índices** adequados,
- e (opcionalmente) uma **reescrita** que reduz a cardinalidade antes do join final.

## Arquivos

1. **create-tabelas-loja.sql** — Esquema base  
   Cria `clientes`, `produtos`, `pedidos`, `itens_pedido` com chaves/relacionamentos.

2. **query-lenta.sql** — Consulta lenta de exemplo  
   Faz `JOIN` entre as quatro tabelas e filtra por **intervalo de datas**, **categoria** e **cidade**. Ordena por data. 

3. **otimizacoes-indexes.sql** — Índices propostos  
   Inclui índices em colunas de **filtro** e **junção** para apoiar o plano de execução.

---
