CREATE OR REPLACE FUNCTION listar_movimentacoes()
RETURNS TABLE (
    Tipo VARCHAR(10),
    Data TIMESTAMP,
    Quantidade INT,
    Produto VARCHAR(100),
    Descricao TEXT
)
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN QUERY
    SELECT 
        m.tipo,
        m.data,
        m.quantidade,
        p.nome AS Produto,
        m.descricao
    FROM movimentacoes m
    JOIN Produtos p ON m.produto_id = p.id;
END;
$$;