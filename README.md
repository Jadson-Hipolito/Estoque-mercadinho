# 🛒 Estoque Mercadinho

Sistema de controle de estoque simples e eficiente para pequenos comércios, desenvolvido com **PostgreSQL** e gerenciado via **terminal Linux (WSL)**. O projeto oferece funções SQL customizadas para gerenciamento de fornecedores, produtos, movimentações de estoque e vendas.

---

## 📌 Visão Geral

Este projeto tem como objetivo fornecer um banco de dados relacional funcional e organizado, permitindo:

- Gerenciar cadastros de fornecedores e produtos
- Registrar entradas e saídas de estoque
- Controlar vendas e calcular faturamento
- Executar consultas padronizadas por meio de funções
- Automatizar comandos com `PREPARE` e `EXECUTE`
- Garantir integridade referencial entre tabelas

---

## 🗃️ Estrutura do Banco

As tabelas principais incluem:

| Tabela                 | Descrição                                   |
|------------------------|---------------------------------------------|
| **Fornecedores**       | Contém dados de empresas fornecedoras       |
| **Produtos**           | Contém os produtos do estoque               |
| **Movimentacoes_Estoque** | Registra entradas e saídas físicas       |
| **Vendas**             | Registra vendas realizadas e valores totais |

---

📄 Apresentação em PDF [https://github.com/Jadson-Hipolito/Estoque-mercadinho/blob/main/slides_apresentacao.pdf.pdf](https://powerpoint.cloud.microsoft/open/onedrive/?docId=2E880091516DB3E8%21sc8e3a7a7d1b94ba884eed0dfc1d0f41d&driveId=2E880091516DB3E8)

## 🛠️ Funções Criadas

As funções `plpgsql` facilitam a consulta dos dados:

```sql

SELECT atualizar_preco_produto(produto_id, novo_preco); -- Atualiza o preço de um produto específico
SELECT atualizar_fornecedor(p_produto_id, p_novo_fornecedor_id); --atualiza o fornecedor

SELECT * FROM buscar_fornecedor(p_id); --buscar fornecedor pelo id

SELECT excluir_produto(id); -- Exclui um produto (desde que sem estoque)
SELECT excluir_fornecedor(p_fornecedor_id); -- Exclui um fornecedor (desde que não forneca nehnum produto atualmente)

SELECT inserir_fornecedor(p_id, 'p_nome', 'p_contato', 'p_historico');
SELECT inserir_movimentacoes('entrada' ou 'saida', quantidade, produto_id, 'descricao');
SELECT inserir_produto(p_id INT, p_nome TEXT, p_categoria TEXT, p_preco NUMERIC, p_quantidade INT, p_fornecedor_id INT);
SELECT inserir_venda(p_produto_id INT, p_quantidade INT);

SELECT * FROM listar_fornecedores(); -- Lista todos os fornecedores cadastrados
SELECT * FROM listar_produtos(); -- Lista todos os produtos com detalhes completos
SELECT * FROM listar_produtos_categoria('categoria'); -- Lista produtos por categoria
SELECT * FROM listar_produtos_fornecedor(id); -- Lista produtos de um fornecedor específico
SELECT * FROM listar_movimentacoes(); -- Lista todas as movimentações registradas
SELECT * FROM listar_movimentacoes_periodo('2025-06-10', '2025-06-28'); -- exemplo (20 de junho a 28 de junho)
SELECT * FROM listar_vendas(); -- Lista todas as vendas registradas
SELECT * FROM listar_vendas_por_periodo('2025-06-01', '2025-06-15'); -- exemplo (1 de junho a 15 de junho)
SELECT * FROM listar_vendas_produto(p_produto_id); -- Lista todas as vendas registradas de um produto
SELECT * FROM Produtos_Estoque_Baixo; -- Lista produtos com estoque abaixo do mínimo (view ou função específica)

SELECT media_categoria('categoria'); -- Retorna a média de preços da categoria

--inserir itens nas tabelas
\i /mnt/c/Users/jadso/OneDrive/Documentos/github/Estoque-mercadinho/inserts_script.sql


limpar tabelas
TRUNCATE TABLE
    Vendas,
    movimentacoes,
    Produtos,
    Fornecedores
RESTART IDENTITY CASCADE;
