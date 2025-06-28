CREATE OR REPLACE FUNCTION listar_vendas_periodo(
    p_data_inicio DATE,
    p_data_fim DATE
)
RETURNS TABLE (
    data TIMESTAMP,
    produto TEXT,
    quantidade INT,
    valor_total NUMERIC
) AS $$
BEGIN
    RETURN QUERY
    SELECT 
        v.data,
        p.nome AS produto,
        v.quantidade,
        v.valor_total
    FROM vendas v
    JOIN produtos p ON v.produto_id = p.id
    WHERE v.data::DATE BETWEEN p_data_inicio AND p_data_fim;
END;
$$ LANGUAGE plpgsql;