CREATE PROCEDURE adicionar_produto(nome VARCHAR, categoria VARCHAR, preco DECIMAL)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO Produtos (nome, categoria, preco) VALUES (nome, categoria, preco);
END;
$$;
