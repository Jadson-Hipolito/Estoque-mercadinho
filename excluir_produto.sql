CREATE OR REPLACE FUNCTION excluir_produto(p_produto_id INT)
RETURNS TEXT AS $$
DECLARE
    v_quant INT;
BEGIN
    -- Verifica se o produto existe e recupera o estoque atual
    SELECT quantidade INTO v_quant
    FROM produtos
    WHERE id = p_produto_id;

    IF NOT FOUND THEN
        RETURN '❌ Produto não encontrado.';
    END IF;

    IF v_quant > 0 THEN
        RETURN '⚠️ Produto não pode ser excluído: ainda possui ' || v_quant || ' unidades em estoque.';
    END IF;

    -- Exclui registros relacionados
    DELETE FROM vendas WHERE produto_id = p_produto_id;
    DELETE FROM movimentacoes WHERE produto_id = p_produto_id;

    -- Por fim, remove o produto
    DELETE FROM produtos WHERE id = p_produto_id;

    RETURN '✅ Produto, movimentações e vendas associadas excluídos com sucesso.';
END;
$$ LANGUAGE plpgsql;