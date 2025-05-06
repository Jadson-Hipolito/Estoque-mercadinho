WITH Movimentacao_Recente AS (
    SELECT * FROM Movimentacoes_Estoque
    WHERE data >= DATE_SUB(NOW(), INTERVAL 30 DAY)
)
SELECT 
    m.tipo,
    m.data,
    p.nome AS Produto,
    m.quantidade
FROM Movimentacao_Recente m
LEFT JOIN Produtos p ON m.produto_id = p.id;
