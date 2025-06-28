CREATE OR REPLACE FUNCTION atualizar_fornecedor(
    p_produto_id INT,
    p_novo_fornecedor_id INT
)
RETURNS TEXT AS $$
DECLARE
    v_existe_produto INT;
    v_existe_fornecedor INT;
BEGIN
    -- Verifica se o produto existe
    SELECT COUNT(*) INTO v_existe_produto FROM produtos WHERE id = p_produto_id;
    IF v_existe_produto = 0 THEN
        RETURN '❌ Produto com ID ' || p_produto_id || ' não encontrado.';
    END IF;

    -- Verifica se o novo fornecedor existe
    SELECT COUNT(*) INTO v_existe_fornecedor FROM fornecedores WHERE id = p_novo_fornecedor_id;
    IF v_existe_fornecedor = 0 THEN
        RETURN '❌ Fornecedor com ID ' || p_novo_fornecedor_id || ' não encontrado.';
    END IF;

    -- Faz a atualização
    UPDATE produtos
    SET fornecedor_id = p_novo_fornecedor_id
    WHERE id = p_produto_id;

    RETURN '✅ Produto ID ' || p_produto_id || ' agora está associado ao fornecedor ID ' || p_novo_fornecedor_id || '.';
END;
$$ LANGUAGE plpgsql;