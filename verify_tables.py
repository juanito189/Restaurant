import MySQLdb

conn = MySQLdb.connect(host='127.0.0.1', user='root', password='', db='restaurante')
cursor = conn.cursor()
cursor.execute("SHOW TABLES LIKE 'pedidos_usuario'")
result = cursor.fetchone()
if result:
    print('✓ Tabla pedidos_usuario EXISTE')
else:
    print('✗ Tabla NO existe')
    print('Creando tablas...')
    with open('create_pedidos_tables.sql', 'r') as f:
        sql = f.read()
        for statement in sql.split(';'):
            if statement.strip():
                cursor.execute(statement)
    conn.commit()
    print('✓ Tablas creadas')

cursor.close()
conn.close()
