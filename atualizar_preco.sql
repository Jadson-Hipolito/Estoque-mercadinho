CREATE FUNCTION atualizar_preco_produto(
    produto_id INT,
    novo_preco NUMERIC(10,2)
) RETURNS VOID 
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE Produtos
    SET preco = novo_preco
    WHERE id = produto_id;
END;
$$;
