-- Criação do Banco de Dados (executar fora do psql ou conectar depois com \c)
CREATE DATABASE estoque_mercadinho;

-- Conectar ao banco no terminal psql:
-- \c estoque_mercadinho

-- Tabela de Fornecedores
CREATE TABLE Fornecedores (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    contato VARCHAR(100),
    historico TEXT
);

-- Tabela de Produtos
CREATE TABLE Produtos (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    categoria VARCHAR(50),
    preco NUMERIC(10,2) NOT NULL,
    quantidade INT NOT NULL,
    fornecedor_id INT,
    FOREIGN KEY (fornecedor_id) REFERENCES Fornecedores(id)
);

-- Tabela de Movimentações de Estoque
CREATE TABLE movimentacoes (
    tipo VARCHAR(10) NOT NULL CHECK (tipo IN ('entrada', 'saida')),
    data TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    quantidade INT NOT NULL CHECK (quantidade > 0),
    descricao TEXT NOT NULL,
    produto_id INT NOT NULL,
    FOREIGN KEY (produto_id) REFERENCES Produtos(id)
);

-- Tabela de Vendas
CREATE TABLE Vendas (
    produto_id INT NOT NULL,
    data TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    quantidade INT NOT NULL,
    valor_total NUMERIC(10,2) NOT NULL,
    FOREIGN KEY (produto_id) REFERENCES Produtos(id)
);