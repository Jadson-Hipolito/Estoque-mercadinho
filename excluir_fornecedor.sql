CREATE OR REPLACE FUNCTION excluir_fornecedor(p_fornecedor_id INT)
RETURNS TEXT AS $$
DECLARE
    v_produtos INT;
BEGIN
    -- Verifica se o fornecedor existe e se há produtos ligados a ele
    SELECT COUNT(*) INTO v_produtos
    FROM produtos
    WHERE fornecedor_id = p_fornecedor_id;

    IF v_produtos > 0 THEN
        RETURN '❌ Fornecedor não pode ser excluído: há ' || v_produtos || ' produto(s) associado(s).';
    END IF;

    -- Tenta excluir o fornecedor
    DELETE FROM fornecedores
    WHERE id = p_fornecedor_id;

    IF FOUND THEN
        RETURN '✅ Fornecedor excluído com sucesso.';
    ELSE
        RETURN '❌ Fornecedor não encontrado.';
    END IF;
END;
$$ LANGUAGE plpgsql;