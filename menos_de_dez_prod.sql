CREATE VIEW Produtos_Estoque_Baixo AS
SELECT id, nome, quantidade
FROM Produtos
WHERE quantidade < 10;
