CREATE FUNCTION movimentacao_recente()
RETURNS TABLE (
    tipo VARCHAR(10),
    data TIMESTAMP,
    produto VARCHAR(100),
    quantidade INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN QUERY 
    SELECT 
        m.tipo,
        m.data,
        p.nome AS produto,
        m.quantidade
    FROM Movimentacoes_Estoque m
    LEFT JOIN Produtos p ON m.produto_id = p.id
    WHERE m.data >= CURRENT_DATE - INTERVAL '30 days';
END;
$$;
