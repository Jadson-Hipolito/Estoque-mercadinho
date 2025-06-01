CREATE FUNCTION vendas()
RETURNS TABLE (
    Produto VARCHAR(100),
    Total_Vendido BIGINT, 
    Valor_Total NUMERIC(10,2)
)
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN QUERY 
    SELECT 
        p.nome AS Produto,
        SUM(v.quantidade)::BIGINT AS Total_Vendido,  
        SUM(v.valor_total) AS Valor_Total
    FROM Vendas v
    INNER JOIN Produtos p ON v.produto_id = p.id
    GROUP BY p.nome;
END;
$$;
