\c estoque_mercadinho

-- Conecte-se ao banco:
-- \c estoque_mercadinho

-- 1️⃣ Fornecedores
INSERT INTO Fornecedores (id, nome, contato, historico) VALUES
(1, 'Fornecedor A', 'email@a.com', 'Enviou 3 pedidos'),
(2, 'Fornecedor B', 'email@b.com', 'Enviou 2 pedidos'),
(3, 'Fornecedor C', 'email@c.com', 'Enviou 5 pedidos'),
(4, 'Fornecedor D', 'email@d.com', 'Enviou 1 pedido'),
(5, 'Fornecedor E', 'email@e.com', 'Enviou 4 pedidos'),
(6, 'Fornecedor F', 'email@f.com', 'Enviou 2 pedidos'),
(7, 'Fornecedor G', 'email@g.com', 'Enviou 6 pedidos'),
(8, 'Fornecedor H', 'email@h.com', 'Enviou 1 pedido'),
(9, 'Fornecedor I', 'email@i.com', 'Enviou 3 pedidos'),
(10, 'Fornecedor J', 'email@j.com', 'Enviou 4 pedidos');

-- 2️⃣ Produtos
INSERT INTO Produtos (id, nome, categoria, preco, quantidade, fornecedor_id) VALUES
(1, 'Arroz', 'Alimentos', 25.00, 100, 1),
(2, 'Feijão', 'Alimentos', 10.00, 80, 2),
(3, 'Óleo de Soja', 'Alimentos', 8.00, 50, 3),
(4, 'Açúcar', 'Alimentos', 7.00, 60, 4),
(5, 'Farinha de Trigo', 'Alimentos', 12.00, 90, 5),
(6, 'Sal', 'Condimentos', 3.00, 200, 6),
(7, 'Macarrão', 'Massas', 15.00, 40, 7),
(8, 'Molho de Tomate', 'Condimentos', 5.00, 75, 8),
(9, 'Café', 'Bebidas', 20.00, 110, 9),
(10, 'Leite', 'Bebidas', 7.50, 130, 10);

-- 3️⃣ Movimentações de Estoque (com descrições)
INSERT INTO Movimentacoes_Estoque (tipo, quantidade, produto_id, descricao) VALUES
('entrada', 50, 1, 'Compra inicial'),
('entrada', 30, 2, 'Compra inicial'),
('saida', 10, 3, 'Venda'),
('entrada', 20, 4, 'Reposição'),
('saida', 5, 5, 'Venda'),
('entrada', 15, 6, 'Nova remessa'),
('saida', 7, 7, 'Saída por venda direta'),
('entrada', 25, 8, 'Remessa recebida'),
('saida', 12, 9, 'Venda promocional'),
('entrada', 40, 10, 'Compra mensal');

-- 4️⃣ Vendas (batem com produtos cadastrados)
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