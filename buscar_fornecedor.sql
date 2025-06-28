CREATE OR REPLACE FUNCTION buscar_fornecedor(p_id INT)
RETURNS TABLE (
    id INT,
    nome TEXT,
    contato TEXT,
    historico TEXT
) AS $$
BEGIN
    RETURN QUERY
    SELECT id, nome, contato, historico
    FROM fornecedores
    WHERE id = p_id;
END;
$$ LANGUAGE plpgsql;