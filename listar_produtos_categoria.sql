CREATE OR REPLACE FUNCTION listar_produtos_categoria(p_categoria TEXT)
RETURNS TABLE (
    id INT,
    nome TEXT,
    preco NUMERIC,
    quantidade INT,
    fornecedor TEXT
) AS $$
BEGIN
    RETURN QUERY
    SELECT 
        p.id,
        p.nome::TEXT,
        p.preco,
        p.quantidade,
        f.nome::TEXT AS fornecedor
    FROM produtos p
    LEFT JOIN fornecedores f ON p.fornecedor_id = f.id
    WHERE LOWER(p.categoria) = LOWER(p_categoria);
END;
$$ LANGUAGE plpgsql;