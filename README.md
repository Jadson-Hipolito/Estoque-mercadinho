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

## 🛠️ Funções Criadas

As funções `plpgsql` facilitam a consulta dos dados:

```sql
SELECT * FROM listar_fornecedores();
SELECT * FROM listar_produtos();
SELECT * FROM listar_movimentacoes();
SELECT * FROM listar_vendas();
SELECT * FROM Produtos_Estoque_Baixo;
SELECT * FROM movimentacao_recente();
SELECT * FROM vendas();
SELECT atualizar_preco_produto(id, preco);
SELECT inserir_venda_auto(id, quantidade);

adicionar varios itens nas tabelas
\i /mnt/c/Users/jadso/OneDrive/Documentos/github/Estoque-mercadinho/inserts_script.sql

limpar tabelas
TRUNCATE TABLE
    Vendas,
    Movimentacoes_Estoque,
    Produtos,
    Fornecedores
RESTART IDENTITY CASCADE;