CREATE OR REPLACE FUNCTION atualizar_nome_produto(
    p_id INT,
    p_novo_nome VARCHAR(100)
)
RETURNS VOID AS $$
BEGIN
    UPDATE Produtos
    SET nome = p_novo_nome
    WHERE id = p_id;

    IF NOT FOUND THEN
        RAISE NOTICE 'Nenhum produto com ID % foi encontrado.', p_id;
    END IF;
END;
$$ LANGUAGE plpgsql;