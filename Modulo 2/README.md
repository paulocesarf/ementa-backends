# 🛒 Projeto Banco de Dados: E-commerce + Auditoria

Este projeto simula a estrutura completa de um sistema de e-commerce, incluindo:

- Modelagem de dados com tabelas relacionais
- Controle de estoque, pedidos e pagamentos
- Consulta analítica de produtos mais vendidos
- Sistema de auditoria com triggers e funções PL/pgSQL

## 📦 Estrutura dos Arquivos

`ecommerce.sql`          - Criação do banco de dados com tabelas principais: produtos, categorias, clientes, pedidos, pagamentos e estoque |
`consulta-questao-2.sql` - Consulta SQL para extrair os 10 produtos mais vendidos no 1º semestre de 2025 |
`auditoria.sql`          - Tabela `auditoria` para registrar operações de INSERT, UPDATE e DELETE com dados antigos/novos |
`pl-pgsql.sql`           - Função `func_auditoria()` + trigger para aplicar a auditoria automaticamente |
