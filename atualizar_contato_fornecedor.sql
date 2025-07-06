CREATE OR REPLACE FUNCTION atualizar_contato_fornecedor(
    f_id INT,
    f_novo_contato VARCHAR(100)
)
RETURNS VOID AS $$
BEGIN
    UPDATE Fornecedores
    SET contato = f_novo_contato
    WHERE id = f_id;

    IF NOT FOUND THEN
        RAISE NOTICE 'Nenhum fornecedor com ID % foi encontrado.', p_id;
    END IF;
END;
$$ LANGUAGE plpgsql;