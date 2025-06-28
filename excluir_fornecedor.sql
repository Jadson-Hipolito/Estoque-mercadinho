CREATE OR REPLACE FUNCTION excluir_fornecedor(p_fornecedor_id INT)
RETURNS TEXT AS $$
DECLARE
    v_produtos INT;
    v_existe INT;
BEGIN
    -- Verifica se o fornecedor existe
    SELECT COUNT(*) INTO v_existe
    FROM fornecedores
    WHERE id = p_fornecedor_id;

    IF v_existe = 0 THEN
        RETURN '❌ Fornecedor com ID ' || p_fornecedor_id || ' não encontrado.';
    END IF;

    -- Verifica se há produtos vinculados
    SELECT COUNT(*) INTO v_produtos
    FROM produtos
    WHERE fornecedor_id = p_fornecedor_id;

    IF v_produtos > 0 THEN
        RETURN '❌ Fornecedor não pode ser excluído: há ' || v_produtos || ' produto(s) associado(s).';
    END IF;

    -- Exclui o fornecedor
    DELETE FROM fornecedores
    WHERE id = p_fornecedor_id;

    RETURN '✅ Fornecedor excluído com sucesso.';
END;
$$ LANGUAGE plpgsql;