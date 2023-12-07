from flask import Flask, request, jsonify
import sqlite3

app = Flask(__name__)

# Database setup
def init_db():
    conn = sqlite3.connect('database.db')
    conn.execute('CREATE TABLE IF NOT EXISTS items (id INTEGER PRIMARY KEY, name TEXT)')
    conn.close()

@app.route('/items', methods=['GET', 'POST'])
def manage_items():
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

@app.route('/items/<int:item_id>', methods=['PUT'])
def update_item(item_id):
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

if __name__ == '__main__':
    init_db()
    # Run the app publicly on the network
    app.run(host='127.0.0.1', port=8080, debug=True)
