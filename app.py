import sqlite3
from flask import Flask, jsonify, request
import mariadb
from pkg_resources import dist_factory

app = Flask(__name__)

@app.route("/items")
def Order_detail():
    mari = mariadb.connect(
        user = "minecraft",
        password ="minecraft111",
        host ="10.9.120.5",
        database= "minecraft"
    )
    cur = mari.cursor()
    cur.execute("SELECT * FROM items")

    items = [column[0] for column in cur.description]
    
    tabla = []
    for row in cur:
        tabla.append(dict(zip(items, row)))

    return jsonify(tabla)


@app.route("/items/<int:id>")
def Tarta(id):
    mari = mariadb.connect(
        user = "minecraft",
        password ="minecraft111",
        host ="10.9.120.5",
        database= "mineacraft"
    )
    cur = mari.cursor()
    cur.execute("SELECT * FROM items WHERE ID= ?", (id,))

    items = [column[0] for column in cur.description]
    
    tabla = [dict(zip(items, row)) for row in cur.fetchall()]

    return jsonify(tabla)

@app.route("/items",methods=('POST',))
def agregar_items():
    nombre = request.json["nombre"]

    db = sqlite3.connect(db_file, detect_types=sqlite3.PARSE_DECLTYPES)
    dbrow_factory = dict_factory 

    qinserta = """ INSERT INTO items(name) VALUES (?) """
    db.execute(qinserta,(nombre,))
    db.commit()

    db.close()

    return {"nombre" : nombre, "items" : []} 