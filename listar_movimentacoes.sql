CREATE FUNCTION listar_movimentacoes()
RETURNS TABLE (
    ID INT,
    Tipo VARCHAR(10),
    Data TIMESTAMP,
    Quantidade INT,
    Produto VARCHAR(100)
)
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN QUERY
    SELECT 
        m.id,
        m.tipo,
        m.data,
        m.quantidade,
        p.nome AS Produto
    FROM Movimentacoes_Estoque m
    JOIN Produtos p ON m.produto_id = p.id;
END;
$$;