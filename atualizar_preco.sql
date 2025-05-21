CREATE PROCEDURE atualizar_preco_produto(produto_id INT, novo_preco DECIMAL)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE Produtos
    SET preco = novo_preco
    WHERE id = produto_id;
END;
$$;
