CREATE OR REPLACE FUNCTION inserir_produto(
    p_id INT,
    p_nome TEXT,
    p_categoria TEXT,
    p_preco NUMERIC,
    p_quantidade INT,
    p_fornecedor_id INT
)
RETURNS VOID AS $$
DECLARE
    v_produto_existente INT;
    v_fornecedor_existente INT;
BEGIN
    -- Verifica se já existe produto com o ID informado
    SELECT COUNT(*) INTO v_produto_existente
    FROM Produtos
    WHERE id = p_id;

    IF v_produto_existente > 0 THEN
        RAISE NOTICE '❌ Já existe um produto com o ID %.', p_id;
        RETURN;
    END IF;

    -- Verifica se o fornecedor existe
    SELECT COUNT(*) INTO v_fornecedor_existente
    FROM Fornecedores
    WHERE id = p_fornecedor_id;

    IF v_fornecedor_existente = 0 THEN
        RAISE NOTICE '⚠️ Nenhum fornecedor encontrado com o ID %.', p_fornecedor_id;
        RETURN;
    END IF;

    -- Insere o novo produto apenas se todos os dados foram recebidos
    INSERT INTO Produtos (id, nome, categoria, preco, quantidade, fornecedor_id)
    VALUES (p_id, p_nome, p_categoria, p_preco, p_quantidade, p_fornecedor_id);

    RAISE NOTICE '✅ Produto "%'' inserido com sucesso com ID %.', p_nome, p_id;
    RETURN
END;
$$ LANGUAGE plpgsql;