CREATE OR REPLACE FUNCTION atualizar_nome_fornecedor(
    f_id INT,
    f_novo_nome VARCHAR(100)
)
RETURNS VOID AS $$
BEGIN
    UPDATE Fornecedores
    SET nome = f_novo_nome
    WHERE id = f_id;

    IF NOT FOUND THEN
        RAISE NOTICE 'Nenhum fornecedor com ID % foi encontrado.', p_id;
    END IF;
END;
$$ LANGUAGE plpgsql;