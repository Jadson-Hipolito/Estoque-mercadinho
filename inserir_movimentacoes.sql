CREATE OR REPLACE FUNCTION inserir_movimentacoes(
    p_tipo TEXT,
    p_quantidade INT,
    p_produto_id INT,
    p_descricao TEXT DEFAULT NULL
)
RETURNS VOID AS $$
DECLARE
    v_existente INT;
    v_estoque INT;
BEGIN
    -- Verifica se o produto existe
    SELECT COUNT(*) INTO v_existente
    FROM Produtos
    WHERE id = p_produto_id;

    IF v_existente = 0 THEN
        RAISE NOTICE '❌ Produto com ID % não encontrado.', p_produto_id;
        RETURN;
    END IF;

    IF LOWER(p_tipo) = 'entrada' THEN

        -- Atualiza o estoque do produto existente
        UPDATE Produtos
        SET quantidade = quantidade + p_quantidade
        WHERE id = p_produto_id;

        RAISE NOTICE '📦 Entrada registrada: +% unidades no produto ID %.', p_quantidade, p_produto_id;

    ELSIF LOWER(p_tipo) = 'saida' THEN

        SELECT quantidade INTO v_estoque
        FROM Produtos
        WHERE id = p_produto_id;

        IF p_quantidade > v_estoque THEN
            RAISE NOTICE '⚠️ Estoque insuficiente: tentativa de saída de %, estoque atual: %.', p_quantidade, v_estoque;
            RETURN;
        END IF;

        UPDATE Produtos
        SET quantidade = quantidade - p_quantidade
        WHERE id = p_produto_id;

        RAISE NOTICE '📤 Saída registrada: -% unidades no produto ID %.', p_quantidade, p_produto_id;

    ELSE
        RAISE NOTICE '⚠️ Tipo inválido: "%". Use "entrada" ou "saida".', p_tipo;
        RETURN;
    END IF;

    -- Registra a movimentação
    INSERT INTO movimentacoes (tipo, quantidade, produto_id, descricao)
    VALUES (p_tipo, p_quantidade, p_produto_id, p_descricao);

END;
$$ LANGUAGE plpgsql;