CREATE OR REPLACE FUNCTION listar_produtos_fornecedor(p_fornecedor_id INT)
RETURNS TABLE (
    id INT,
    nome VARCHAR(100),
    categoria VARCHAR(50),
    preco NUMERIC(10,2),
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
    WHERE p.fornecedor_id = p_fornecedor_id
    ORDER BY p.id;
END;
$$ LANGUAGE plpgsql;