CREATE OR REPLACE FUNCTION incerir_movimentacoes(
    p_tipo TEXT,
    p_quantidade INT,
    p_produto_id INT,
    p_preco NUMERIC DEFAULT NULL,
    p_fornecedor_id INT DEFAULT NULL,
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

    IF LOWER(p_tipo) = 'entrada' THEN
        IF v_existente = 0 THEN
            -- Insere novo produto com os dados fornecidos
            INSERT INTO Produtos (id, preco, quantidade, fornecedor_id, descricao)
            VALUES (p_produto_id, p_preco, p_quantidade, p_fornecedor_id, p_descricao);

            RAISE NOTICE '✅ Novo produto criado com ID % e entrada de % unidades.', p_produto_id, p_quantidade;
        ELSE
            -- Atualiza o estoque do produto existente
            UPDATE Produtos
            SET quantidade = quantidade + p_quantidade
            WHERE id = p_produto_id;

            RAISE NOTICE '📦 Entrada registrada: +% unidades no produto ID %.', p_quantidade, p_produto_id;
        END IF;

    ELSIF LOWER(p_tipo) = 'saida' THEN
        IF v_existente = 0 THEN
            RAISE NOTICE '❌ Saída não permitida: produto com ID % não existe.', p_produto_id;
            RETURN;
        END IF;

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

    -- Registrar a movimentação com descrição
    INSERT INTO Movimentacoes_Estoque (tipo, quantidade, produto_id, descricao)
    VALUES (p_tipo, p_quantidade, p_produto_id, p_descricao);

    RETURN;
END;
$$ LANGUAGE plpgsql;