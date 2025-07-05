CREATE OR REPLACE FUNCTION listar_movimentacoes_periodo(
    p_data_inicio DATE,
    p_data_fim DATE
)
RETURNS TABLE (
    tipo VARCHAR(10),
    data TIMESTAMP,
    quantidade INT,
    produto TEXT,
    descricao TEXT
) AS $$
BEGIN
    RETURN QUERY
    SELECT
        m.tipo,
        m.data,
        m.quantidade,
        p.nome::TEXT AS produto,
        m.descricao
    FROM movimentacoes m
    JOIN produtos p ON m.produto_id = p.id
    WHERE m.data::DATE BETWEEN p_data_inicio AND p_data_fim;
END;
$$ LANGUAGE plpgsql;