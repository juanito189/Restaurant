import os
import django

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'sistema_web.settings')
django.setup()

from django.contrib.auth.models import User
from gestion.models import PerfilUsuario

# Crear usuario admin
if not User.objects.filter(username='admin').exists():
    admin_user = User.objects.create_superuser('admin', 'admin@restaurante.com', 'admin123456')
    PerfilUsuario.objects.create(usuario=admin_user, rol='admin')
    print('✅ Usuario admin creado: admin / admin123456')
else:
    print('⚠️ Usuario admin ya existe')

# Crear usuario cliente de prueba
if not User.objects.filter(username='cliente').exists():
    cliente_user = User.objects.create_user('cliente', 'cliente@ejemplo.com', 'cliente123456', first_name='Juan')
    PerfilUsuario.objects.create(usuario=cliente_user, rol='cliente')
    print('✅ Usuario cliente creado: cliente / cliente123456')
else:
    print('⚠️ Usuario cliente ya existe')

# Mostrar todos los usuarios creados
print("\n📋 Usuarios en el sistema:")
users = User.objects.all()
for u in users:
    if hasattr(u, 'perfil'):
        print(f"  • {u.username} ({u.get_full_name() or 'Sin nombre'}) - Rol: {u.perfil.get_rol_display()}")
    else:
        print(f"  • {u.username} (Sin perfil)")
