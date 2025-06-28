CREATE OR REPLACE FUNCTION inserir_fornecedor(
    p_id INT,
    p_nome VARCHAR,
    p_contato VARCHAR,
    p_historico TEXT
)
RETURNS VOID AS $$
DECLARE
    v_existente INT;
BEGIN
    -- Verifica se já existe fornecedor com o ID informado
    SELECT COUNT(*) INTO v_existente
    FROM Fornecedores
    WHERE id = p_id;

    IF v_existente > 0 THEN
        RAISE NOTICE '⚠️ Já existe um fornecedor com o ID %.', p_id;
        RETURN;
    END IF;

    -- Insere novo fornecedor com ID definido
    INSERT INTO Fornecedores (id, nome, contato, historico)
    VALUES (p_id, p_nome, p_contato, p_historico);

    RAISE NOTICE '✅ Fornecedor "%'' inserido com ID %.', p_nome, p_id;
    RETURN
END;
$$ LANGUAGE plpgsql;