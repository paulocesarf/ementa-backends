-- Cria e popula a tabela 'vendas' para teste dos relatórios de Window Functions
DROP TABLE IF EXISTS vendas;
CREATE TABLE vendas (
  id SERIAL PRIMARY KEY,
  vendedor TEXT NOT NULL,
  data DATE NOT NULL,
  valor NUMERIC(12,2) NOT NULL CHECK (valor >= 0)
);

-- Dados de exemplo: 3 vendedores, várias datas e valores
INSERT INTO vendas (vendedor, data, valor) VALUES
('Ana',  CURRENT_DATE - 30, 1200),
('Ana',  CURRENT_DATE - 25,  800),
('Ana',  CURRENT_DATE - 20, 1500),
('Ana',  CURRENT_DATE - 10,  900),
('Ana',  CURRENT_DATE -  3, 2000),
('Bruno',CURRENT_DATE - 28, 1800),
('Bruno',CURRENT_DATE - 15, 2200),
('Bruno',CURRENT_DATE -  7,  500),
('Carla',CURRENT_DATE - 27,  900),
('Carla',CURRENT_DATE - 21,  600),
('Carla',CURRENT_DATE - 14, 1900),
('Carla',CURRENT_DATE -  2,  700);
