CREATE FUNCTION verificar_estoque_produto(produto_id INT) RETURNS INT AS $$
DECLARE quantidade INT;
BEGIN
    SELECT quantidade INTO quantidade
    FROM Produtos
    WHERE id = produto_id;
    RETURN quantidade;
END;
$$ LANGUAGE plpgsql;
