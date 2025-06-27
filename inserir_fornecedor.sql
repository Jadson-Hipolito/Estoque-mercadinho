PREPARE inserir_fornecedor (VARCHAR, VARCHAR, TEXT) AS
INSERT INTO Fornecedores (nome, contato, historico) VALUES ($1, $2, $3);

-- Depois, o usuário executa assim:
EXECUTE inserir_fornecedor('Super Atacado', 'atacado@exemplo.com', 'Entrega semanal de alimentos');