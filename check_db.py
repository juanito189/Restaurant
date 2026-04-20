import MySQLdb
import os
import django

os.environ.setdefault("DJANGO_SETTINGS_MODULE", "sistema_web.settings")
django.setup()

from django.db import connection

print("=" * 60)
print("VERIFICANDO CONEXIÓN Y TABLAS")
print("=" * 60)

# Verificar conexión
try:
    with connection.cursor() as cursor:
        cursor.execute("SELECT DATABASE()")
        db = cursor.fetchone()[0]
        print(f"✓ Base de datos actual: {db}")
        
        # Listar todas las tablas
        cursor.execute("SHOW TABLES")
        tables = cursor.fetchall()
        print(f"\nTablas en la base de datos:")
        for table in tables:
            print(f"  - {table[0]}")
        
        # Verificar si existen nuestras tablas
        print("\n" + "=" * 60)
        cursor.execute("SHOW TABLES LIKE 'pedidos_usuario'")
        if cursor.fetchone():
            print("✓ pedidos_usuario EXISTE")
        else:
            print("✗ pedidos_usuario NO existe")
            
        cursor.execute("SHOW TABLES LIKE 'items_pedidos'")
        if cursor.fetchone():
            print("✓ items_pedidos EXISTE")
        else:
            print("✗ items_pedidos NO existe")
            
except Exception as e:
    print(f"✗ Error de conexión: {e}")
