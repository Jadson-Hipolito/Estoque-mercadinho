CREATE FUNCTION media_categoria(categoria VARCHAR) 
RETURNS NUMERIC(10,2) AS $$
DECLARE media_preco NUMERIC(10,2);
BEGIN
    SELECT AVG(preco) INTO media_preco
    FROM Produtos
    WHERE categoria = categoria;
    RETURN media_preco;
END;
$$ LANGUAGE plpgsql;
