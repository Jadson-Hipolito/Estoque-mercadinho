CREATE OR REPLACE FUNCTION listar_movimentacoes_fornecedor(p_fornecedor_id INT)
RETURNS TABLE (
    tipo TEXT,
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
    WHERE p.fornecedor_id = p_fornecedor_id;
END;
$$ LANGUAGE plpgsql;