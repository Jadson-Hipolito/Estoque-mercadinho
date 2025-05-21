CREATE PROCEDURE adicionar_produto(nome VARCHAR, categoria VARCHAR, preco DECIMAL, quantidade INT, fornecedor_id INT)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO Produtos (nome, categoria, preco, quantidade, fornecedor_id) 
    VALUES (nome, categoria, preco, quantidade, fornecedor_id);
END;
$$;
