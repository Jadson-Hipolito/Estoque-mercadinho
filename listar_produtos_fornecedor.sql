CREATE OR REPLACE FUNCTION listar_produtos_fornecedor(p_fornecedor_id INT)
RETURNS TABLE (
    produto_id INT,
    nome TEXT,
    categoria TEXT,
    preco NUMERIC,
    quantidade INT
) AS $$
BEGIN
    RETURN QUERY
    SELECT 
        p.id,
        p.nome,
        p.categoria,
        p.preco,
        p.quantidade
    FROM produtos p
    WHERE p.fornecedor_id = p_fornecedor_id;
END;
$$ LANGUAGE plpgsql;