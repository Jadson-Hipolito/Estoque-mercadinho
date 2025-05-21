# 📌 Função SQL - Cálculo da Média de Preço por Categoria  

## 🛠️ Função `calcular_media_preco_categoria`  
Esta função calcula a **média de preços** dos produtos pertencentes a uma categoria específica, facilitando a análise de valores no banco de dados.  

📌 **Uso no sistema:**  
- Auxilia na definição de preços competitivos.  
- Permite comparações entre categorias de produtos.  
- Útil para relatórios e estratégias de precificação.  

🖥️ **Código SQL:**  
```sql
CREATE FUNCTION calcular_media_preco_categoria(categoria_param VARCHAR) RETURNS DECIMAL AS $$
DECLARE media_preco DECIMAL;
BEGIN
    SELECT AVG(preco) INTO media_preco
    FROM Produtos
    WHERE categoria = categoria_param;
    RETURN media_preco;
END;
$$ LANGUAGE plpgsql;
