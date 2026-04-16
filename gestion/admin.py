from django.contrib import admin

from .models import( Alimentos, 
AlimentosPlatos,
Cliente, 
Domicilios, 
Empleados,
Estadopedido,
Pedidos,
Persona,
Platos,
PlatosPedidos,
Tiposdedocumentos
)

# Register your models here.
admin.site.register(Alimentos)
admin.site.register(AlimentosPlatos)
admin.site.register(Cliente)
admin.site.register(Domicilios)
admin.site.register(Empleados)
admin.site.register(Estadopedido)
admin.site.register(Pedidos)
admin.site.register(Persona)
admin.site.register(Platos)
admin.site.register(PlatosPedidos)
admin.site.register(Tiposdedocumentos)
