CREATE OR REPLACE FUNCTION inserir_venda(
    p_produto_id INT,
    p_quantidade INT
)
RETURNS VOID AS $$
DECLARE
    v_preco NUMERIC;
    v_valor_total NUMERIC;
    v_estoque INT;
BEGIN
    -- Verificar se o produto existe e obter preço e estoque
    SELECT preco, quantidade INTO v_preco, v_estoque
    FROM Produtos
    WHERE id = p_produto_id;

    IF NOT FOUND THEN
        RAISE NOTICE '⚠️ Produto com ID % não encontrado.', p_produto_id;
        RETURN;
    END IF;

    -- Verificar estoque disponível
    IF v_estoque < p_quantidade THEN
        RAISE NOTICE '❌ Estoque insuficiente. Estoque atual: %, tentativa de venda: %.',
                     v_estoque, p_quantidade;
        RETURN;
    END IF;

    -- Calcular valor total
    v_valor_total := v_preco * p_quantidade;

    -- Registrar a venda
    INSERT INTO Vendas (produto_id, quantidade, valor_total)
    VALUES (p_produto_id, p_quantidade, v_valor_total);

    -- Atualizar o estoque
    UPDATE Produtos
    SET quantidade = quantidade - p_quantidade
    WHERE id = p_produto_id;

    -- Registrar movimentação de estoque com descrição “Venda realizada”
    INSERT INTO movimentacoes (tipo, quantidade, produto_id, descricao)
    VALUES ('saida', p_quantidade, p_produto_id, 'Venda realizada');

    RAISE NOTICE '✅ Venda realizada: % unidades vendidas, total de R$%.', p_quantidade, v_valor_total;
    RETURN;
END;
$$ LANGUAGE plpgsql;