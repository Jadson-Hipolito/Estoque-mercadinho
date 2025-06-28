CREATE OR REPLACE FUNCTION listar_movimentacoes_produto(p_produto_id INT)
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
        p.nome AS produto,
        m.descricao
    FROM movimentacoes m
    JOIN produtos p ON m.produto_id = p.id
    WHERE p.id = p_produto_id;
END;
$$ LANGUAGE plpgsql;