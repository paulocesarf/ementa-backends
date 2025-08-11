## Criar Tabelas

**Arquivo:** `create-tabelas-loja.sql`

Cria a estrutura das tabelas para simular um sistema de pedidos com clientes, produtos e itens de pedido. Serve como base para testar performance de consultas:

- `clientes`
- `produtos`
- `pedidos`
- `itens_pedido`

## Consulta Lenta

**Arquivo:** `query-lenta.sql`

Executa uma consulta envolvendo múltiplos `JOINs`, filtros e ordenação em colunas não indexadas. Essa consulta simula um cenário de baixa performance:

- Filtro por `data_pedido`
- Filtro por `categoria` e `cidade`
- `ORDER BY` em `data_pedido` sem índice

## Otimizações com Índices

**Arquivo:** `otimizacoes-indexes.sql`

Cria índices estratégicos para melhorar a performance da consulta lenta. Os índices reduzem o tempo de leitura e ordenação dos dados nas seguintes colunas:

- `pedidos.data_pedido`
- `clientes.cidade`
- `produtos.categoria`
- `pedidos.cliente_id`
- `itens_pedido.pedido_id`
- `itens_pedido.produto_id`

## README

1. Execute o script `create-tabelas-loja.sql` para criar a base de dados
2. Execute o script `query-lenta.sql` para verificar o comportamento sem otimizações
3. Execute o script `otimizacoes-indexes.sql` para aplicar os índices
4. Reexecute a `query-lenta.sql` para comparar o ganho de performance

Você pode usar `EXPLAIN ANALYZE` para avaliar a diferença antes e depois da criação dos índices.

## Arquivos do Projeto

`create-tabelas-loja.sql`   - Criação da estrutura de tabelas para simulação  
`query-lenta.sql`           - Consulta original sem otimização  
`otimizacoes-indexes.sql`   - Índices para melhorar performance da consulta  
