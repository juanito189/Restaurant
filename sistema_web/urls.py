"""
URL configuration for sistema_web project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/6.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from gestion import views

urlpatterns = [
    path('admin/', admin.site.urls),
    
    # ──────────────────────────────────────
    # AUTENTICACIÓN
    # ──────────────────────────────────────
    path('login/', views.login_view, name='login'),
    path('registro/', views.registro_view, name='registro'),
    path('logout/', views.logout_view, name='logout'),
    
    # ──────────────────────────────────────
    # MENÚ Y PLATOS
    # ──────────────────────────────────────
    path('', views.menu, name='menu'),
    path('menu/', views.menu, name='menu_alt'),
    path('platos/<int:plato_id>/', views.detalle_plato, name='detalle_plato'),
    path('platos/<int:plato_id>/editar/', views.editar_plato, name='editar_plato'),
    path('platos/<int:plato_id>/eliminar/', views.eliminar_plato, name='eliminar_plato'),
    path('platos/crear/', views.crear_plato, name='crear_plato'),
    
    # ──────────────────────────────────────
    # PEDIDOS
    # ──────────────────────────────────────
    # Carrito y gestión de items
    path('pedidos/crear/', views.crear_pedido, name='crear_pedido'),
    path('pedidos/carrito/', views.carrito_pedido, name='carrito_pedido'),
    path('pedidos/carrito/agregar/<int:plato_id>/', views.agregar_item_pedido, name='agregar_item_pedido'),
    path('pedidos/carrito/actualizar/<int:item_id>/', views.actualizar_item_pedido, name='actualizar_item_pedido'),
    path('pedidos/carrito/eliminar/<int:item_id>/', views.eliminar_item_pedido, name='eliminar_item_pedido'),
    path('pedidos/confirmar/', views.confirmar_pedido, name='confirmar_pedido'),
    
    # Pedidos del usuario
    path('pedidos/', views.mis_pedidos, name='mis_pedidos'),
    path('pedidos/<int:pedido_id>/', views.detalle_pedido, name='detalle_pedido'),
    
    # Gestión de pedidos (admin)
    path('admin/pedidos/', views.listar_todos_pedidos, name='listar_todos_pedidos'),
    path('admin/pedidos/<int:pedido_id>/estado/', views.cambiar_estado_pedido, name='cambiar_estado_pedido'),
]
