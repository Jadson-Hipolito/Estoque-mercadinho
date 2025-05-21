# Procedimento SQL - Atualização de Preço de Produto  

## 🛠️ Procedimento `atualizar_preco_produto`  
Este procedimento modifica o preço de um produto já cadastrado no banco de dados, garantindo uma atualização eficiente e segura.  

📌 **Uso no sistema:**  
- Permite reajustar preços conforme promoções e mudanças de mercado.  
- Facilita a manutenção dos valores dos produtos sem a necessidade de comandos manuais.  
- Garante que as atualizações sejam feitas corretamente na tabela `Produtos`.  

🖥️ **Código SQL:**  
```sql
CREATE PROCEDURE atualizar_preco_produto(
    produto_id INT, 
    novo_preco DECIMAL
)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE Produtos
    SET preco = novo_preco
    WHERE id = produto_id;
END;
$$;
