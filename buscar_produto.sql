CREATE OR REPLACE FUNCTION buscar_produto(p_id INT)
RETURNS TABLE (
    id INT,
    nome TEXT,
    categoria TEXT,
    preco NUMERIC,
    quantidade INT,
    fornecedor TEXT
) AS $$
BEGIN
    RETURN QUERY
    SELECT 
        pr.id,
        pr.nome,
        pr.categoria,
        pr.preco,
        pr.quantidade,
        f.nome AS fornecedor
    FROM produtos pr
    LEFT JOIN fornecedores f ON pr.fornecedor_id = f.id
    WHERE pr.id = p_id;
END;
$$ LANGUAGE plpgsql;