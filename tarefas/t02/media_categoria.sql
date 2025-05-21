CREATE FUNCTION calcular_media_preco_categoria(categoria_param VARCHAR) RETURNS DECIMAL AS $$
DECLARE media_preco DECIMAL;
BEGIN
    SELECT AVG(preco) INTO media_preco
    FROM Produtos
    WHERE categoria = categoria_param;
    RETURN media_preco;
END;
$$ LANGUAGE plpgsql;
