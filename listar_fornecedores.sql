CREATE OR REPLACE FUNCTION listar_fornecedores()
RETURNS TABLE (
    id INT,
    nome VARCHAR,
    contato VARCHAR,
    historico TEXT
) AS $$
BEGIN
    RETURN QUERY
    SELECT 
        f.id,
        f.nome,
        f.contato,
        f.historico
    FROM Fornecedores f
    ORDER BY f.id;
END;
$$ LANGUAGE plpgsql;