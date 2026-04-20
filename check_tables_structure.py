import MySQLdb

conn = MySQLdb.connect(host='127.0.0.1', user='root', password='', db='restaurante')
cursor = conn.cursor()

print("=" * 60)
print("ESTRUCTURA DE TABLAS")
print("=" * 60)

# Verificar estructura de pedidos_usuario
print("\nTabla: pedidos_usuario")
cursor.execute("DESCRIBE pedidos_usuario")
for row in cursor.fetchall():
    print(f"  {row}")

# Verificar estructura de items_pedidos
print("\nTabla: items_pedidos")
cursor.execute("DESCRIBE items_pedidos")
for row in cursor.fetchall():
    print(f"  {row}")

cursor.close()
conn.close()
