# 📌 Função SQL - Verificação de Estoque  

## 🛠️ Função `verificar_estoque_produto`  
Esta função retorna a **quantidade disponível** de um produto no estoque, com base no seu ID informado como parâmetro.  

📌 **Uso no sistema:**  
- Permite verificar rapidamente a quantidade de um item antes de realizar uma venda.  
- Útil para controle de estoque e planejamento de reposição de produtos.  
- Pode ser usada em relatórios para análise de disponibilidade de itens.  

🖥️ **Código SQL:**  
```sql
CREATE FUNCTION verificar_estoque_produto(produto_id INT) RETURNS INT AS $$
DECLARE quantidade INT;
BEGIN
    SELECT quantidade INTO quantidade
    FROM Produtos
    WHERE id = produto_id;
    RETURN quantidade;
END;
$$ LANGUAGE plpgsql;
