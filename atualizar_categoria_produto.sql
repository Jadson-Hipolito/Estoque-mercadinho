CREATE OR REPLACE FUNCTION atualizar_categoria_produto(
    p_id INT,
    p_categoria VARCHAR(50)
)
RETURNS VOID AS $$
BEGIN
    UPDATE Produtos
    SET nome = p_categoria
    WHERE id = p_id;

    IF NOT FOUND THEN
        RAISE NOTICE 'Nenhum produto com ID % foi encontrado.', p_id;
    END IF;
END;
$$ LANGUAGE plpgsql;