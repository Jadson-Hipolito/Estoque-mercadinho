\c estoque_mercadinho

-- Inserindo dados na tabela de Fornecedores
INSERT INTO Fornecedores (nome, contato, historico) VALUES
('Fornecedor A', 'email@a.com', 'Enviou 3 pedidos'),
('Fornecedor B', 'email@b.com', 'Enviou 2 pedidos'),
('Fornecedor C', 'email@c.com', 'Enviou 5 pedidos'),
('Fornecedor D', 'email@d.com', 'Enviou 1 pedido'),
('Fornecedor E', 'email@e.com', 'Enviou 4 pedidos'),
('Fornecedor F', 'email@f.com', 'Enviou 2 pedidos'),
('Fornecedor G', 'email@g.com', 'Enviou 6 pedidos'),
('Fornecedor H', 'email@h.com', 'Enviou 1 pedido'),
('Fornecedor I', 'email@i.com', 'Enviou 3 pedidos'),
('Fornecedor J', 'email@j.com', 'Enviou 4 pedidos');

-- Inserindo dados na tabela de Produtos
INSERT INTO Produtos (nome, categoria, preco, quantidade, fornecedor_id) VALUES
('Arroz', 'Alimentos', 25.00, 100, 1),
('Feijão', 'Alimentos', 10.00, 80, 2),
('Óleo de Soja', 'Alimentos', 8.00, 50, 3),
('Açúcar', 'Alimentos', 7.00, 60, 4),
('Farinha de Trigo', 'Alimentos', 12.00, 90, 5),
('Sal', 'Condimentos', 3.00, 200, 6),
('Macarrão', 'Massas', 15.00, 40, 7),
('Molho de Tomate', 'Condimentos', 5.00, 75, 8),
('Café', 'Bebidas', 20.00, 110, 9),
('Leite', 'Bebidas', 7.50, 130, 10);

-- Inserindo dados na tabela de Movimentações de Estoque
INSERT INTO Movimentacoes_Estoque (tipo, quantidade, produto_id) VALUES
('entrada', 50, 1),
('entrada', 30, 2),
('saida', 10, 3),
('entrada', 20, 4),
('saida', 5, 5),
('entrada', 15, 6),
('saida', 7, 7),
('entrada', 25, 8),
('saida', 12, 9),
('entrada', 40, 10);

-- Inserindo dados na tabela de Vendas
INSERT INTO Vendas (produto_id, quantidade, valor_total) VALUES
(1, 5, 125.00),
(2, 3, 30.00),
(3, 1, 8.00),
(4, 2, 14.00),
(5, 4, 48.00),
(6, 8, 24.00),
(7, 6, 90.00),
(8, 2, 10.00),
(9, 9, 180.00),
(10, 7, 52.50);
