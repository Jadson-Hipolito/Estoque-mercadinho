CREATE FUNCTION listar_fornecedores()
RETURNS TABLE (
    ID INT,
    Nome VARCHAR(100),
    Contato VARCHAR(100),
    Historico TEXT
)
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN QUERY
    SELECT id, nome, contato, historico
    FROM Fornecedores;
END;
$$;