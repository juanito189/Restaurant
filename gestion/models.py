from django.db import models
from django.contrib.auth.models import User

# ─────────────────────────────────────────
#  AUTENTICACIÓN Y AUTORIZACIÓN
# ─────────────────────────────────────────
class PerfilUsuario(models.Model):
    ROLES = [
        ('admin', 'Administrador'),
        ('cliente', 'Cliente'),
    ]
    
    usuario = models.OneToOneField(User, on_delete=models.CASCADE, related_name='perfil')
    rol = models.CharField(max_length=20, choices=ROLES, default='cliente')
    fecha_creacion = models.DateTimeField(auto_now_add=True)
    
    class Meta:
        verbose_name_plural = 'Perfiles de Usuarios'
    
    def __str__(self):
        return f"{self.usuario.username} - {self.get_rol_display()}"

class Pedido(models.Model):
    ESTADOS = [
        ('pendiente', 'Pendiente'),
        ('confirmado', 'Confirmado'),
        ('preparando', 'Preparando'),
        ('listo', 'Listo'),
        ('cancelado', 'Cancelado'),
    ]
    
    id_pedido = models.AutoField(primary_key=True)
    usuario = models.ForeignKey(User, on_delete=models.CASCADE, related_name='pedidos')
    platos = models.ManyToManyField('Platos', through='ItemPedido')
    estado = models.CharField(max_length=20, choices=ESTADOS, default='pendiente')
    fecha_pedido = models.DateTimeField(auto_now_add=True)
    fecha_actualizacion = models.DateTimeField(auto_now=True)
    total = models.DecimalField(max_digits=10, decimal_places=2, default=0)
    
    class Meta:
        managed = False
        db_table = 'pedidos_usuario'
        verbose_name_plural = 'Pedidos'
        ordering = ['-fecha_pedido']
    
    def __str__(self):
        return f"Pedido #{self.id_pedido} - {self.usuario.username}"

class ItemPedido(models.Model):
    id_item = models.AutoField(primary_key=True)
    pedido = models.ForeignKey(Pedido, on_delete=models.CASCADE, related_name='items')
    plato = models.ForeignKey('Platos', on_delete=models.CASCADE)
    cantidad = models.PositiveIntegerField(default=1)
    precio_unitario = models.DecimalField(max_digits=10, decimal_places=2)
    
    class Meta:
        managed = False
        db_table = 'items_pedidos'
        verbose_name_plural = 'Items de Pedidos'
    
    def __str__(self):
        return f"{self.plato.nombre} x{self.cantidad}"

class Alimentos(models.Model):
    idalimentos = models.AutoField(db_column='idAlimentos', primary_key=True)
    nombre = models.CharField(max_length=50)
    cantidad = models.DecimalField(max_digits=10, decimal_places=2)

    class Meta:
        managed = False
        db_table = 'alimentos'
        verbose_name_plural = 'Alimentos'
        
    def __str__(self):
        return self.nombre

class Platos(models.Model):
    id_plato = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=40)
    precio = models.DecimalField(max_digits=10, decimal_places=2)

    class Meta:
        managed = False
        db_table = 'platos'
        verbose_name_plural = 'Platos'
        
    def __str__ (self):
        return self.nombre

class AlimentosPlatos(models.Model):
    id_alimentosplatos = models.AutoField(db_column='id_alimentosPlatos', primary_key=True)
    id_plato = models.ForeignKey(Platos, models.DO_NOTHING, db_column='id_plato')
    idalimentos = models.ForeignKey(Alimentos, models.DO_NOTHING, db_column='idAlimentos')
    cantidad_utilizada = models.DecimalField(max_digits=10, decimal_places=2)

    class Meta:
        managed = False
        db_table = 'alimentos_platos'
        verbose_name_plural = 'Alimentos Platos'
    
    def __str__ (self):
        # Usamos los nombres en lugar de los IDs
        return f"{self.id_plato.nombre} - {self.idalimentos.nombre}"

class Tiposdedocumentos(models.Model):
    tiposdedocumentos_id = models.AutoField(db_column='TiposDeDocumentos_id', primary_key=True)
    nombre = models.CharField(max_length=25)

    class Meta:
        managed = False
        db_table = 'tiposdedocumentos'
        verbose_name_plural = 'Tipos de Documentos'
        
    def __str__(self):
        return self.nombre

class Persona(models.Model):
    tipodedocumento_id = models.IntegerField(db_column='TipoDeDocumento_id', blank=True, null=True)
    numerodocumento = models.CharField(db_column='NumeroDocumento', unique=True, max_length=10)
    primernombre = models.CharField(db_column='PrimerNombre', max_length=25)
    segundonombre = models.CharField(db_column='SegundoNombre', max_length=25, blank=True, null=True)
    primerapellido = models.CharField(db_column='PrimerApellido', max_length=25)
    segundoapellido = models.CharField(db_column='SegundoApellido', max_length=25, blank=True, null=True)
    fechadenacimiento = models.CharField(db_column='FechaDeNacimiento', max_length=25, blank=True, null=True)
    correo = models.CharField(db_column='Correo', max_length=70, blank=True, null=True)
    telefono = models.CharField(db_column='Telefono', max_length=15, blank=True, null=True)
    tiposdedocumentos = models.ForeignKey(Tiposdedocumentos, models.DO_NOTHING, db_column='TiposDeDocumentos_id', blank=True, null=True)
    id_persona = models.IntegerField(primary_key=True)

    class Meta:
        managed = False
        db_table = 'persona'
        verbose_name_plural = 'Personas'
        
    def __str__ (self):
        return f"{self.primernombre} {self.primerapellido}"

class Cliente(models.Model):
    id_cliente = models.AutoField(primary_key=True)
    # Relación configurada correctamente hacia Persona
    id_persona = models.ForeignKey(Persona, models.DO_NOTHING, db_column='id_persona')
    puntos_acumulados = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'cliente'
        verbose_name_plural = 'Clientes'
        
    def __str__ (self):
        return f"{self.id_persona.primernombre} {self.id_persona.primerapellido}"

class Empleados(models.Model):
    id_empleados = models.AutoField(primary_key=True)
    # Cambiado a ForeignKey para conectar con Persona
    id_persona = models.ForeignKey(Persona, models.DO_NOTHING, db_column='id_persona')
    salario_mensual = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'empleados'
        verbose_name_plural = 'Empleados'

    def __str__(self):
        return f"Empleado: {self.id_persona.primernombre} {self.id_persona.primerapellido}"

class Estadopedido(models.Model):
    idestadopedido = models.AutoField(db_column='idEstadoPedido', primary_key=True)
    estado = models.CharField(max_length=25)

    class Meta:
        managed = False
        db_table = 'estadopedido'
        verbose_name_plural = 'Estado Pedidos'
        
    def __str__(self):
        return self.estado

class Pedidos(models.Model):
    id_pedido = models.AutoField(primary_key=True)
    id_cliente = models.ForeignKey(Cliente, models.DO_NOTHING, db_column='id_cliente')
    fecha = models.DateField(db_column='Fecha')
    id_estadopedido = models.ForeignKey(Estadopedido, models.DO_NOTHING, db_column='id_EstadoPedido')

    class Meta:
        managed = False
        db_table = 'pedidos'
        verbose_name_plural = 'Pedidos'
        
    def __str__(self):
        return f"Pedido #{self.id_pedido} - {self.id_cliente.id_persona.primernombre}"

class PlatosPedidos(models.Model):
    id_platos_pedidos = models.AutoField(primary_key=True)
    id_pedido = models.ForeignKey(Pedidos, models.DO_NOTHING, db_column='id_pedido')
    id_plato = models.ForeignKey(Platos, models.DO_NOTHING, db_column='id_plato')
    cantidad = models.IntegerField()
    precio_unitario = models.DecimalField(max_digits=10, decimal_places=2)

    class Meta:
        managed = False
        db_table = 'platos_pedidos'
        verbose_name_plural ='Platos Pedidos'
        
    def __str__(self):
        return f"Pedido #{self.id_pedido.id_pedido} - {self.id_plato.nombre}"

class Domicilios(models.Model):
    id_domicilios = models.AutoField(primary_key=True)
    id_pedido = models.ForeignKey(Pedidos, models.DO_NOTHING, db_column='id_pedido')
    id_cliente = models.ForeignKey(Cliente, models.DO_NOTHING, db_column='id_cliente')
    id_empleados = models.ForeignKey(Empleados, models.DO_NOTHING, db_column='id_empleados')
    direccion = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'domicilios'
        verbose_name_plural = 'Domicilios'
        
    def __str__(self):
        return f"Domicilio {self.id_domicilios} - {self.id_cliente.id_persona.primernombre}"