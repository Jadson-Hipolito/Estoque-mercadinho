CREATE OR REPLACE FUNCTION listar_produtos()
RETURNS TABLE (
    Produto_ID INT,
    Produto VARCHAR(100),
    Categoria VARCHAR(50),
    Preco NUMERIC(10,2),
    Quantidade INT,
    Fornecedor VARCHAR(100),
    Contato VARCHAR(100)
) 
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN QUERY 
    SELECT 
        p.id AS Produto_ID,
        p.nome AS Produto,
        p.categoria,
        p.preco,
        p.quantidade,
        f.nome AS Fornecedor,
        f.contato
    FROM Produtos p
    LEFT JOIN Fornecedores f ON p.fornecedor_id = f.id
    ORDER BY p.id;
END;
$$;