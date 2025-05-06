# Projeto 01 - Sistema de Estoque para Mercadinho  

Este projeto contém a estrutura do banco de dados para gerenciamento de estoque em um mercadinho.

## 📂 Scripts do Banco de Dados  

### 🔹 Criação do esquema relacional  
[Script de criação](create_script.sql)

### 🔹 Povoamento do esquema relacional  
[Script de inserção de dados](inserts_script.sql)

## 📊 Modelo de Dados  

```mermaid
erDiagram
    Produtos {
        int id
        string nome
        string categoria
        decimal preco
        int quantidade
        int fornecedor_id
    }
    Fornecedores {
        int id
        string nome
        string contato
        string historico
    }
    Movimentacoes_Estoque {
        int id
        string tipo
        datetime data
        int quantidade
        int produto_id
    }
    Vendas {
        int id
        int produto_id
        datetime data
        int quantidade
        decimal valor_total
    }
    Produtos ||--o{ Fornecedores : pertence
    Produtos ||--o{ Movimentacoes_Estoque : movimenta
    Produtos ||--o{ Vendas : vende
