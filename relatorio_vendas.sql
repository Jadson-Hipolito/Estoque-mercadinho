SELECT 
    p.nome AS Produto,
    SUM(v.quantidade) AS Total_Vendido,
    SUM(v.valor_total) AS Valor_Total
FROM Vendas v
INNER JOIN Produtos p ON v.produto_id = p.id
GROUP BY p.nome;
