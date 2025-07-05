CREATE OR REPLACE FUNCTION listar_vendas_produto(p_produto_id INT)
RETURNS TABLE (
    data TIMESTAMP,
    quantidade INT,
    valor_total NUMERIC,
    produto TEXT
) AS $$
BEGIN
    RETURN QUERY
    SELECT
        v.data,
        v.quantidade,
        v.valor_total,
        p.nome::TEXT AS produto
    FROM vendas v
    JOIN produtos p ON v.produto_id = p.id
    WHERE v.produto_id = p_produto_id;
END;
$$ LANGUAGE plpgsql;