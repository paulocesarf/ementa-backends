-- Questão 1 - CREATE TABLE
CREATE TABLE vendas (
    id SERIAL PRIMARY KEY,
    vendedor VARCHAR(100),
    data DATE,
    valor NUMERIC(10,2)
);
