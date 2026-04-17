from django.shortcuts import render, redirect, get_object_or_404
from django.contrib import messages
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.models import User
from django.contrib.auth.decorators import login_required
from django.views.decorators.http import require_http_methods
from .models import Platos, PerfilUsuario


# ─────────────────────────────────────────
#  FUNCIONES AUXILIARES
# ─────────────────────────────────────────
def es_admin(user):
    """Verificar si el usuario es administrador"""
    if not user.is_authenticated:
        return False
    return hasattr(user, 'perfil') and user.perfil.rol == 'admin'


def admin_required(view_func):
    """Decorador para proteger vistas de administrador"""
    def wrapper(request, *args, **kwargs):
        if not es_admin(request.user):
            messages.error(request, 'No tienes permisos para acceder a esta página.')
            return redirect('menu')
        return view_func(request, *args, **kwargs)
    return wrapper


# ─────────────────────────────────────────
#  MENÚ
# ─────────────────────────────────────────
def menu(request):
    platos = Platos.objects.prefetch_related(
        'alimentosplatos_set__idalimentos'
    ).all()
    precios = list(platos.values_list('precio', flat=True))
    context = {
        'platos':       platos,
        'total_platos': platos.count(),
        'precio_min':   min(precios) if precios else 0,
        'precio_max':   max(precios) if precios else 0,
    }
    return render(request, 'gestion/menu.html', context)


# ─────────────────────────────────────────
#  PLATOS — READ
# ─────────────────────────────────────────
def detalle_plato(request, plato_id):
    plato = get_object_or_404(Platos, id_plato=plato_id)
    
    # Obtener alimentos relacionados
    ingredientes = plato.alimentosplatos_set.all()
    
    context = {
        'plato': plato,
        'ingredientes': ingredientes,
    }
    return render(request, 'gestion/detalle_plato.html', context)


# ─────────────────────────────────────────
#  PLATOS — CREATE
# ─────────────────────────────────────────
@admin_required
def crear_plato(request):
    if request.method == 'POST':
        try:
            nombre = request.POST.get('nombre', '').strip()
            precio = request.POST.get('precio', '').strip()
            imagen = request.FILES.get('imagen')
            
            if not nombre:
                messages.error(request, 'El nombre del plato es obligatorio.')
                return redirect('crear_plato')
            
            if not precio:
                messages.error(request, 'El precio es obligatorio.')
                return redirect('crear_plato')
            
            try:
                precio = float(precio)
                if precio < 0:
                    raise ValueError("El precio no puede ser negativo.")
            except ValueError as e:
                messages.error(request, f'Precio inválido: {e}')
                return redirect('crear_plato')
            
            plato = Platos.objects.create(
                nombre=nombre,
                precio=precio,
                imagen=imagen
            )
            messages.success(request, f'Plato "{nombre}" creado exitosamente.')
            return redirect('menu')
        
        except Exception as e:
            messages.error(request, f'Error al crear el plato: {e}')
            return redirect('crear_plato')
    
    return render(request, 'gestion/crear_plato.html')


# ─────────────────────────────────────────
#  PLATOS — UPDATE
# ─────────────────────────────────────────
@admin_required
def editar_plato(request, plato_id):
    plato = get_object_or_404(Platos, id_plato=plato_id)
    
    if request.method == 'POST':
        try:
            nombre = request.POST.get('nombre', '').strip()
            precio = request.POST.get('precio', '').strip()
            imagen = request.FILES.get('imagen')
            
            if not nombre:
                messages.error(request, 'El nombre del plato es obligatorio.')
                return redirect('editar_plato', plato_id=plato_id)
            
            if not precio:
                messages.error(request, 'El precio es obligatorio.')
                return redirect('editar_plato', plato_id=plato_id)
            
            try:
                precio = float(precio)
                if precio < 0:
                    raise ValueError("El precio no puede ser negativo.")
            except ValueError as e:
                messages.error(request, f'Precio inválido: {e}')
                return redirect('editar_plato', plato_id=plato_id)
            
            plato.nombre = nombre
            plato.precio = precio
            if imagen:
                plato.imagen = imagen
            plato.save()
            
            messages.success(request, f'Plato "{nombre}" actualizado exitosamente.')
            return redirect('detalle_plato', plato_id=plato_id)
        
        except Exception as e:
            messages.error(request, f'Error al actualizar el plato: {e}')
            return redirect('editar_plato', plato_id=plato_id)
    
    context = {'plato': plato}
    return render(request, 'gestion/editar_plato.html', context)


# ─────────────────────────────────────────
#  PLATOS — DELETE
@admin_required
# ─────────────────────────────────────────
def eliminar_plato(request, plato_id):
    plato = get_object_or_404(Platos, id_plato=plato_id)
    
    if request.method == 'POST':
        try:
            nombre_plato = plato.nombre
            plato.delete()
            messages.success(request, f'Plato "{nombre_plato}" eliminado exitosamente.')
            return redirect('menu')
        except Exception as e:
            messages.error(request, f'Error al eliminar el plato: {e}')
            return redirect('detalle_plato', plato_id=plato_id)
    
    context = {'plato': plato}
    return render(request, 'gestion/confirmar_eliminar_plato.html', context)


# ─────────────────────────────────────────
#  AUTENTICACIÓN
# ─────────────────────────────────────────
@require_http_methods(["GET", "POST"])
def login_view(request):
    """Vista para el inicio de sesión"""
    if request.user.is_authenticated:
        return redirect('menu')
    
    if request.method == 'POST':
        username = request.POST.get('username', '').strip()
        password = request.POST.get('password', '').strip()
        
        if not username or not password:
            messages.error(request, 'Por favor completa todos los campos.')
            return redirect('login')
        
        usuario = authenticate(request, username=username, password=password)
        
        if usuario is not None:
            login(request, usuario)
            messages.success(request, f'¡Bienvenido, {usuario.first_name or usuario.username}!')
            return redirect('menu')
        else:
            messages.error(request, 'Usuario o contraseña incorrectos.')
            return redirect('login')
    
    return render(request, 'gestion/login.html')


@require_http_methods(["GET", "POST"])
def registro_view(request):
    """Vista para registrar nuevos usuarios"""
    if request.user.is_authenticated:
        return redirect('menu')
    
    if request.method == 'POST':
        try:
            username = request.POST.get('username', '').strip()
            email = request.POST.get('email', '').strip()
            first_name = request.POST.get('first_name', '').strip()
            password = request.POST.get('password', '').strip()
            password_confirm = request.POST.get('password_confirm', '').strip()
            
            # Validaciones
            if not all([username, email, first_name, password, password_confirm]):
                messages.error(request, 'Por favor completa todos los campos.')
                return redirect('registro')
            
            if len(password) < 8:
                messages.error(request, 'La contraseña debe tener al menos 8 caracteres.')
                return redirect('registro')
            
            if password != password_confirm:
                messages.error(request, 'Las contraseñas no coinciden.')
                return redirect('registro')
            
            if User.objects.filter(username=username).exists():
                messages.error(request, 'Este nombre de usuario ya existe.')
                return redirect('registro')
            
            if User.objects.filter(email=email).exists():
                messages.error(request, 'Este correo ya está registrado.')
                return redirect('registro')
            
            # Crear usuario
            usuario = User.objects.create_user(
                username=username,
                email=email,
                first_name=first_name,
                password=password
            )
            
            # Crear perfil con rol de cliente
            PerfilUsuario.objects.create(
                usuario=usuario,
                rol='cliente'
            )
            
            messages.success(request, '¡Registro exitoso! Ahora puedes iniciar sesión.')
            return redirect('login')
        
        except Exception as e:
            messages.error(request, f'Error en el registro: {e}')
            return redirect('registro')
    
    return render(request, 'gestion/registro.html')


@login_required(login_url='login')
def logout_view(request):
    """Vista para cerrar sesión"""
    logout(request)
    messages.success(request, 'Sesión cerrada exitosamente.')
    return redirect('menu')
