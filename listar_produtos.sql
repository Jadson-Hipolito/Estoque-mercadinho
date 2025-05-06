SELECT 
    p.id AS Produto_ID,
    p.nome AS Produto,
    p.categoria,
    p.preco,
    f.nome AS Fornecedor,
    f.contato
FROM Produtos p
LEFT JOIN Fornecedores f ON p.fornecedor_id = f.id;
