from flask import Flask, request, jsonify
import sqlite3
from sqlite3 import Error

app = Flask(__name__)

# Database setup
def init_db():
    try:
        conn = sqlite3.connect('database.db')
        conn.execute('CREATE TABLE IF NOT EXISTS items (id INTEGER PRIMARY KEY, name TEXT)')
        conn.close()
    except Error as e:
        print(f"Database error: {e}")

@app.route('/items', methods=['GET', 'POST'])
def manage_items():
    try:
        if request.method == 'GET':
            conn = sqlite3.connect('database.db')
            cursor = conn.cursor()
            cursor.execute("SELECT * FROM items")
            items = cursor.fetchall()
            conn.close()
            return jsonify(items)
        
        if request.method == 'POST':
            new_item = request.json.get('name')
            if not new_item:
                return jsonify({"error": "No name provided"}), 400
            conn = sqlite3.connect('database.db')
            cursor = conn.cursor()
            cursor.execute("INSERT INTO items (name) VALUES (?)", (new_item,))
            conn.commit()
            conn.close()
            return jsonify({"message": "Item added"}), 201

    except Error as e:
        return jsonify({"error": str(e)}), 500

@app.route('/items/<int:item_id>', methods=['PUT'])
def update_item(item_id):
    try:
        update = request.json.get('name')
        if not update:
            return jsonify({"error": "No new name provided"}), 400
        conn = sqlite3.connect('database.db')
        cursor = conn.cursor()
        cursor.execute("UPDATE items SET name = ? WHERE id = ?", (update, item_id))
        if cursor.rowcount == 0:
            return jsonify({"error": "Item not found"}), 404
        conn.commit()
        conn.close()
        return jsonify({"message": "Item updated"})

    except Error as e:
        return jsonify({"error": str(e)}), 500

if __name__ == '__main__':
    init_db()
    app.run(host='127.0.0.1', port=8080, debug=True)
