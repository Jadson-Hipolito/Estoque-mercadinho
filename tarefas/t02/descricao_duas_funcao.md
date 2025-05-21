-- Consulta que lista todos os produtos, incluindo informações do fornecedor associado.
-- Se um produto não tiver fornecedor, ele ainda aparecerá na lista.
SELECT 
    p.id AS Produto_ID,
    p.nome AS Produto,
    p.categoria,
    p.preco,
    f.nome AS Fornecedor,
    f.contato
FROM Produtos p
LEFT JOIN Fornecedores f ON p.fornecedor_id = f.id;

-- Criando uma VIEW que armazena automaticamente uma lista de produtos com estoque abaixo de 10 unidades.
-- Isso facilita o controle de reposição de mercadorias no sistema.
CREATE VIEW Produtos_Estoque_Baixo AS
SELECT id, nome, quantidade
FROM Produtos
WHERE quantidade < 10;
