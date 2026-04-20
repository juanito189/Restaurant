from django.shortcuts import render, redirect, get_object_or_404
from django.contrib import messages
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.models import User
from django.contrib.auth.decorators import login_required
from django.views.decorators.http import require_http_methods
from django.http import JsonResponse
from django.db import transaction
from decimal import Decimal
import logging
from .models import Platos, PerfilUsuario, Pedido, ItemPedido

logger = logging.getLogger(__name__)


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
                precio=precio
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


# ─────────────────────────────────────────
#  PEDIDOS — CREATE
# ─────────────────────────────────────────
@login_required(login_url='login')
@require_http_methods(["POST"])
def crear_pedido(request):
    """Crear un nuevo pedido para el usuario autenticado"""
    try:
        with transaction.atomic():
            # Obtener o crear un pedido pendiente
            pedido, creado = Pedido.objects.get_or_create(
                usuario=request.user,
                estado='pendiente'
            )
            
            if creado:
                messages.success(request, 'Nuevo pedido creado.')
            else:
                messages.info(request, 'Se está usando un pedido existente.')
            
            return redirect('carrito_pedido')
    
    except Exception as e:
        messages.error(request, f'Error al crear el pedido: {e}')
        return redirect('menu')


# ─────────────────────────────────────────
#  PEDIDOS — CARRITO
# ─────────────────────────────────────────
@login_required(login_url='login')
def carrito_pedido(request):
    """Vista del carrito (pedido pendiente)"""
    try:
        pedido, creado = Pedido.objects.get_or_create(
            usuario=request.user,
            estado='pendiente'
        )
        
        items = pedido.items.all().select_related('plato')
        
        # Calcular subtotal para cada item
        for item in items:
            item.subtotal = item.cantidad * item.precio_unitario
        
        # Calcular total
        total = sum(item.subtotal for item in items)
        pedido.total = total
        pedido.save()
        
        context = {
            'pedido': pedido,
            'items': items,
            'total': total,
        }
        return render(request, 'gestion/carrito_pedido.html', context)
    
    except Exception as e:
        messages.error(request, f'Error al cargar el carrito: {e}')
        return redirect('menu')


# ─────────────────────────────────────────
#  PEDIDOS — AGREGAR ITEM
# ─────────────────────────────────────────
@login_required(login_url='login')
@require_http_methods(["POST"])
def agregar_item_pedido(request, plato_id):
    """Agregar un plato al carrito"""
    try:
        # Asegurar que el usuario tenga un perfil
        if not hasattr(request.user, 'perfil'):
            PerfilUsuario.objects.get_or_create(usuario=request.user, defaults={'rol': 'cliente'})
        
        plato = get_object_or_404(Platos, id_plato=plato_id)
        cantidad = int(request.POST.get('cantidad', 1))
        
        if cantidad < 1:
            messages.error(request, 'La cantidad debe ser mayor a 0.')
            return redirect('detalle_plato', plato_id=plato_id)
        
        # Obtener o crear pedido pendiente
        pedido, creado = Pedido.objects.get_or_create(
            usuario=request.user,
            estado='pendiente'
        )
        
        # Verificar si el plato ya está en el pedido
        item_existente = pedido.items.filter(plato=plato).first()
        
        with transaction.atomic():
            if item_existente:
                # Incrementar cantidad
                item_existente.cantidad += cantidad
                item_existente.save()
                messages.success(request, f'Se añadieron {cantidad} más de "{plato.nombre}" al carrito.')
            else:
                # Crear nuevo item
                ItemPedido.objects.create(
                    pedido=pedido,
                    plato=plato,
                    cantidad=cantidad,
                    precio_unitario=plato.precio
                )
                messages.success(request, f'"{plato.nombre}" agregado al carrito.')
        
        return redirect('carrito_pedido')
    
    except ValueError as e:
        logger.error(f"ValueError en agregar_item_pedido: {e}")
        messages.error(request, 'La cantidad debe ser un número válido.')
        return redirect('detalle_plato', plato_id=plato_id)
    except Exception as e:
        logger.error(f"Error al agregar al carrito: {type(e).__name__}: {e}", exc_info=True)
        messages.error(request, f'Error al agregar al carrito: {str(e)}')
        return redirect('menu')


# ─────────────────────────────────────────
#  PEDIDOS — ACTUALIZAR ITEM
# ─────────────────────────────────────────
@login_required(login_url='login')
@require_http_methods(["POST"])
def actualizar_item_pedido(request, item_id):
    """Actualizar cantidad de un item en el carrito"""
    try:
        item = get_object_or_404(ItemPedido, id_item=item_id)
        
        # Verificar que el item pertenece al usuario
        if item.pedido.usuario != request.user:
            messages.error(request, 'No tienes permiso para modificar este item.')
            return redirect('carrito_pedido')
        
        cantidad = int(request.POST.get('cantidad', item.cantidad))
        
        if cantidad < 1:
            messages.error(request, 'La cantidad debe ser mayor a 0.')
            return redirect('carrito_pedido')
        
        item.cantidad = cantidad
        item.save()
        messages.success(request, f'Cantidad de "{item.plato.nombre}" actualizada.')
        return redirect('carrito_pedido')
    
    except ValueError:
        messages.error(request, 'La cantidad debe ser un número válido.')
        return redirect('carrito_pedido')
    except Exception as e:
        messages.error(request, f'Error al actualizar el item: {e}')
        return redirect('carrito_pedido')


# ─────────────────────────────────────────
#  PEDIDOS — ELIMINAR ITEM
# ─────────────────────────────────────────
@login_required(login_url='login')
@require_http_methods(["POST"])
def eliminar_item_pedido(request, item_id):
    """Eliminar un item del carrito"""
    try:
        item = get_object_or_404(ItemPedido, id_item=item_id)
        
        # Verificar que el item pertenece al usuario
        if item.pedido.usuario != request.user:
            messages.error(request, 'No tienes permiso para eliminar este item.')
            return redirect('carrito_pedido')
        
        nombre_plato = item.plato.nombre
        item.delete()
        messages.success(request, f'"{nombre_plato}" eliminado del carrito.')
        return redirect('carrito_pedido')
    
    except Exception as e:
        messages.error(request, f'Error al eliminar el item: {e}')
        return redirect('carrito_pedido')


# ─────────────────────────────────────────
#  PEDIDOS — CONFIRMAR PEDIDO
# ─────────────────────────────────────────
@login_required(login_url='login')
@require_http_methods(["POST"])
def confirmar_pedido(request):
    """Confirmar un pedido (cambiar estado a confirmado)"""
    try:
        pedido = get_object_or_404(Pedido, usuario=request.user, estado='pendiente')
        
        # Verificar que hay items en el pedido
        if not pedido.items.exists():
            messages.error(request, 'No puedes confirmar un pedido vacío.')
            return redirect('carrito_pedido')
        
        # Cambiar estado
        pedido.estado = 'confirmado'
        pedido.save()
        
        messages.success(request, f'Pedido #{pedido.id_pedido} confirmado exitosamente.')
        return redirect('detalle_pedido', pedido_id=pedido.id_pedido)
    
    except Exception as e:
        messages.error(request, f'Error al confirmar el pedido: {e}')
        return redirect('carrito_pedido')


# ─────────────────────────────────────────
#  PEDIDOS — VER DETALLE
# ─────────────────────────────────────────
@login_required(login_url='login')
def detalle_pedido(request, pedido_id):
    """Ver detalles de un pedido específico"""
    try:
        pedido = get_object_or_404(Pedido, id_pedido=pedido_id)
        
        # Verificar que el usuario es el dueño o es admin
        if pedido.usuario != request.user and not es_admin(request.user):
            messages.error(request, 'No tienes permiso para ver este pedido.')
            return redirect('menu')
        
        items = pedido.items.all().select_related('plato')
        
        # Calcular subtotal para cada item
        for item in items:
            item.subtotal = item.cantidad * item.precio_unitario
        
        total = sum(item.subtotal for item in items)
        
        context = {
            'pedido': pedido,
            'items': items,
            'total': total,
        }
        return render(request, 'gestion/detalle_pedido.html', context)
    
    except Exception as e:
        messages.error(request, f'Error al cargar el pedido: {e}')
        return redirect('menu')


# ─────────────────────────────────────────
#  PEDIDOS — LISTAR PEDIDOS DEL USUARIO
# ─────────────────────────────────────────
@login_required(login_url='login')
def mis_pedidos(request):
    """Listar todos los pedidos del usuario autenticado"""
    try:
        pedidos = Pedido.objects.filter(usuario=request.user).order_by('-fecha_pedido')
        
        # Calcular totales
        for pedido in pedidos:
            items = pedido.items.all()
            pedido.total = sum(item.cantidad * item.precio_unitario for item in items)
        
        context = {
            'pedidos': pedidos,
            'total_pedidos': pedidos.count(),
        }
        return render(request, 'gestion/mis_pedidos.html', context)
    
    except Exception as e:
        messages.error(request, f'Error al cargar tus pedidos: {e}')
        return redirect('menu')


# ─────────────────────────────────────────
#  PEDIDOS — CAMBIAR ESTADO (ADMIN)
# ─────────────────────────────────────────
@admin_required
@require_http_methods(["POST"])
def cambiar_estado_pedido(request, pedido_id):
    """Cambiar el estado de un pedido (solo admins)"""
    try:
        pedido = get_object_or_404(Pedido, id_pedido=pedido_id)
        nuevo_estado = request.POST.get('estado', '').strip()
        
        # Validar que el estado es válido
        estados_validos = [opcion[0] for opcion in Pedido.ESTADOS]
        if nuevo_estado not in estados_validos:
            messages.error(request, 'Estado inválido.')
            return redirect('detalle_pedido', pedido_id=pedido_id)
        
        estado_anterior = pedido.get_estado_display()
        pedido.estado = nuevo_estado
        pedido.save()
        
        messages.success(request, f'Estado del pedido #{pedido_id} cambiado de {estado_anterior} a {pedido.get_estado_display()}.')
        return redirect('detalle_pedido', pedido_id=pedido_id)
    
    except Exception as e:
        messages.error(request, f'Error al cambiar el estado: {e}')
        return redirect('detalle_pedido', pedido_id=pedido_id)


# ─────────────────────────────────────────
#  PEDIDOS — LISTAR TODOS (ADMIN)
# ─────────────────────────────────────────
@admin_required
def listar_todos_pedidos(request):
    """Listar todos los pedidos del sistema (solo admins)"""
    try:
        pedidos = Pedido.objects.all().order_by('-fecha_pedido')
        
        # Calcular totales
        for pedido in pedidos:
            items = pedido.items.all()
            pedido.total = sum(item.cantidad * item.precio_unitario for item in items)
        
        estados = dict(Pedido.ESTADOS)
        
        context = {
            'pedidos': pedidos,
            'total_pedidos': pedidos.count(),
            'estados': estados,
        }
        return render(request, 'gestion/listar_pedidos_admin.html', context)
    
    except Exception as e:
        messages.error(request, f'Error al cargar los pedidos: {e}')
        return redirect('menu')
