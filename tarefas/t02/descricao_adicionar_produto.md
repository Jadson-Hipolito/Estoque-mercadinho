# Procedimentos SQL - Gerenciamento de Produtos  

## 🛠️ Procedimento `adicionar_produto`  
Este procedimento insere um novo produto no banco de dados, registrando seu nome, categoria, preço, quantidade e fornecedor. Ele facilita a inclusão de novos itens sem precisar repetir comandos SQL manualmente.  

```sql
CREATE PROCEDURE adicionar_produto(
    nome VARCHAR, 
    categoria VARCHAR, 
    preco DECIMAL, 
    quantidade INT, 
    fornecedor_id INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO Produtos (nome, categoria, preco, quantidade, fornecedor_id) 
    VALUES (nome, categoria, preco, quantidade, fornecedor_id);
END;
$$;
