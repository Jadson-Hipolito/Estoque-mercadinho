CREATE OR REPLACE FUNCTION listar_vendas()
RETURNS TABLE (
    id INT,
    data TIMESTAMP,
    produto VARCHAR(100),
    quantidade INT,
    valor_total NUMERIC
) AS $$
BEGIN
    RETURN QUERY
    SELECT 
        produto_id,
        v.data,
        p.nome AS produto,
        v.quantidade,
        v.valor_total
    FROM vendas v
    JOIN produtos p ON v.produto_id = p.id;
END;
$$ LANGUAGE plpgsql;