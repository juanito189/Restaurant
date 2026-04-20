import MySQLdb

conn = MySQLdb.connect(host='127.0.0.1', user='root', password='', db='restaurante')
cursor = conn.cursor()

print("Alterando tabla items_pedidos...")

try:
    # Primero verificar si la columna ya existe
    cursor.execute("DESCRIBE items_pedidos")
    columns = [row[0] for row in cursor.fetchall()]
    
    if 'pedido_id' not in columns:
        cursor.execute("""
            ALTER TABLE items_pedidos 
            ADD COLUMN pedido_id INT NOT NULL AFTER id_item
        """)
        print("✓ Columna pedido_id agregada")
        
        # Agregar la foreign key
        cursor.execute("""
            ALTER TABLE items_pedidos 
            ADD FOREIGN KEY (pedido_id) REFERENCES pedidos_usuario(id_pedido) ON DELETE CASCADE
        """)
        print("✓ Foreign key agregada")
    else:
        print("✓ Columna pedido_id ya existe")
    
    conn.commit()
    print("\n✓ Tabla alterada exitosamente")
except Exception as e:
    print(f"✗ Error: {e}")
    conn.rollback()
finally:
    cursor.close()
    conn.close()
