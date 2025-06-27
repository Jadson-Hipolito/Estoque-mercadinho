CREATE OR REPLACE FUNCTION atualizar_preco_produto(
    produto_id INT,
    novo_preco NUMERIC(10,2)
) RETURNS VOID 
LANGUAGE plpgsql
AS $$
BEGIN
    IF EXISTS (SELECT 1 FROM Produtos WHERE id = produto_id) THEN
        UPDATE Produtos
        SET preco = novo_preco
        WHERE id = produto_id;
    ELSE
        RAISE NOTICE 'Produto com ID % não encontrado.', produto_id;
    END IF;
END;
$$;
