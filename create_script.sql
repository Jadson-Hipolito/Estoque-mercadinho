-- Criação do Banco de Dados
CREATE DATABASE estoque_mercadinho;
USE estoque_mercadinho;

-- Tabela de Produtos
CREATE TABLE Produtos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    categoria VARCHAR(50),
    preco DECIMAL(10,2) NOT NULL,
    quantidade INT NOT NULL,
    fornecedor_id INT,
    FOREIGN KEY (fornecedor_id) REFERENCES Fornecedores(id)
);

-- Tabela de Fornecedores
CREATE TABLE Fornecedores (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    contato VARCHAR(100),
    historico TEXT
);

-- Tabela de Movimentações de Estoque
CREATE TABLE Movimentacoes_Estoque (
    id INT PRIMARY KEY AUTO_INCREMENT,
    tipo ENUM('entrada', 'saida') NOT NULL,
    data DATETIME DEFAULT CURRENT_TIMESTAMP,
    quantidade INT NOT NULL,
    produto_id INT NOT NULL,
    FOREIGN KEY (produto_id) REFERENCES Produtos(id)
);

-- Tabela de Vendas
CREATE TABLE Vendas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    produto_id INT NOT NULL,
    data DATETIME DEFAULT CURRENT_TIMESTAMP,
    quantidade INT NOT NULL,
    valor_total DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (produto_id) REFERENCES Produtos(id)
);
