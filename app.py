from flask import Flask, request, jsonify, render_template
import psycopg2

app = Flask(__name__)

# Configurar conexão com PostgreSQL
conn = psycopg2.connect(
    dbname="AtividadesBD",
    user="admin",
    password="senha",
    host="localhost",
    port="5432"
)
cursor = conn.cursor()

# Tela inicial
@app.route('/')
def index():
    return render_template('index.html')

# Atualizar preço de um produto
@app.route('/atualizar_preco', methods=['POST'])
def atualizar_preco():
    data = request.json
    produto_id = data["produto_id"]
    novo_preco = data["novo_preco"]

    cursor.execute("CALL atualizar_preco_produto(%s, %s)", (produto_id, novo_preco))
    conn.commit()
    return jsonify({"mensagem": "Preço atualizado com sucesso!"})

# Listar todos os projetos
@app.route('/listar_projetos', methods=['GET'])
def listar_projetos():
    cursor.execute("SELECT id, nome FROM Projetos")
    projetos = cursor.fetchall()
    return jsonify(projetos)

if __name__ == '__main__':
    app.run(debug=True)
