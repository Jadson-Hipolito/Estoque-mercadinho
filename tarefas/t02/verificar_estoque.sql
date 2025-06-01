CREATE FUNCTION verificar_estoque(produto_id INT) 
RETURNS INT 
LANGUAGE plpgsql
AS $$
DECLARE quantidade INT;
BEGIN
    SELECT quantidade INTO quantidade
    FROM produtos  
    WHERE produto_id = verificar_estoque_produto.produto_id; 
    IF NOT FOUND THEN
        quantidade := 0;
    END IF;

    RETURN quantidade;
END;
$$;
