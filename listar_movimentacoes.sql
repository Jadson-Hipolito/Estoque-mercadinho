CREATE OR REPLACE FUNCTION listar_movimentacoes()
RETURNS TABLE (
    tipo VARCHAR(10),
    data TIMESTAMP,
    quantidade INT,
    produto VARCHAR(100),
    descricao TEXT
) AS $$
BEGIN
    RETURN QUERY
    SELECT 
        m.tipo,
        m.data,
        m.quantidade,
        p.nome,
        m.descricao
    FROM movimentacoes m
    JOIN produtos p ON m.produto_id = p.id;
END;
$$ LANGUAGE plpgsql;