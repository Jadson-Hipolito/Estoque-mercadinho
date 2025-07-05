CREATE OR REPLACE FUNCTION media_categoria(p_categoria VARCHAR)
RETURNS NUMERIC AS $$
DECLARE
    v_media NUMERIC;
BEGIN
    SELECT AVG(preco)
    INTO v_media
    FROM Produtos
    WHERE categoria = p_categoria;

    RETURN v_media;
END;
$$ LANGUAGE plpgsql;