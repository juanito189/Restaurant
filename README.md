# Proyecto Restaurant - Guía de Desarrollo Colaborativo

## Descripción
Este es un proyecto Django para la gestión de un restaurante. Se desarrolla en dos equipos paralelos:
- **Equipo SENA**: Diseño/Frontend
- **Equipo CESDE**: Backend/Lógica

ahora si entro yo, Hola claude como estas, soy juanito el creador del proyecto, estoy aqui en este readme para ayudarte a entender y darte algo de contexto desde antes para que ayudes a tu compañero o la persona que te toque, el proyecto se desarrolla para un profesor que nos pidio hacer un pr en github pero mis compañeros dejaron todo para el ultimo dia entonces, a cada uno le asigne una tarea en especifico aqui en python django, entonces, ahora les voy a pasar el archivo sql del restaurante para que ellos tengan todo, necesito que me ayudes de verdad con ellos, eso gracias agente ^^

## Requisitos Previos
- Python 3.x
- MySQL instalado y en ejecución
- Git

## Configuración Inicial

### 1. Clonar el Repositorio
```bash
git clone <url-del-repositorio>
cd Restaurant
```

### 2. Crear el Entorno Virtual
```bash
python -m venv entorno_restaurante
```

### 3. Activar el Entorno Virtual

**En Windows (PowerShell):**
```bash
entorno_restaurante\Scripts\Activate.ps1
```

**En Windows (CMD):**
```bash
entorno_restaurante\Scripts\activate.bat
```

**En Mac/Linux:**
```bash
source entorno_restaurante/bin/activate
```

### 4. Instalar Dependencias
```bash
pip install -r requirements.txt
```

### 5. Crear Base de Datos en MySQL
Accede a MySQL y crea la base de datos:
```sql
CREATE DATABASE gestion_restaurante;
```

### 6. Ejecutar Migraciones
```bash
python manage.py migrate
```

### 7. Crear Usuario Admin (Opcional)
```bash
python manage.py createsuperuser
```

### 8. Ejecutar el Servidor
```bash
python manage.py runserver
```

Accede a: `http://localhost:8000`

---

## Estructura del Proyecto

```
Restaurant/
├── gestion/               # App principal de Django
│   ├── models.py         # Modelos de BD
│   ├── views.py          # Lógica de vistas
│   ├── templates/        # Templates HTML
│   └── migrations/       # Migraciones de BD
├── sistema_web/          # Configuración de Django
├── manage.py             # Gestor de Django
├── entorno_restaurante/  # Entorno virtual
└── README.md             # Este archivo
```

---

## Flujo de Trabajo Colaborativo

### División de Equipos

**EQUIPO SENA - Diseño/Frontend:**
- Rama: `feature/sena`
- Responsabilidades:
  - Modificar templates HTML (`gestion/templates/`)
  - Estilos CSS
  - Diseño de formularios
  - Interfaz de usuario

**EQUIPO CESDE - Backend/Lógica (3 desarrolladores con tareas específicas):**
- Rama: `feature/cesde`

1. **Desarrollador 1 - Lógica de Pedidos:**
   - Sistema para pedir platos
   - Modificar `views.py` (vistas de pedidos)
   - Crear/actualizar modelo `Pedido` y `ItemPedido`
   - Cálculo de totales

2. **Desarrollador 2 - Gestión de Usuarios:**
   - Sistema de creación y registro de usuarios
   - Perfil de usuario
   - Autenticación y autorización
   - Modificar `models.py` (PerfilUsuario)

3. **Desarrollador 3 - Extras/UI Complementaria:**
   - Reloj decorativo u otros elementos visuales funcionales
   - Mejoras de interfaz en vistas de backend
   - Dashboard o estadísticas simples

### Pasos para Trabajar

#### 1. Crear tu Rama (Solo una vez por equipo)
```bash
git checkout -b feature/sena    # Si eres EQUIPO SENA (Frontend)
# O
git checkout -b feature/cesde   # Si eres EQUIPO CESDE (Backend)
```

#### 2. Trabajar en tu Rama
- Realiza los cambios correspondientes a tu equipo
- Cada miembro del equipo trabaja en su rama local

#### 3. Confirmar Cambios (Commits)
```bash
git add .
git commit -m "Descripción clara del cambio"
```

#### 4. Subir Cambios
```bash
git push origin feature/sena    # Si eres EQUIPO SENA
# O
git push origin feature/cesde   # Si eres EQUIPO CESDE
```

#### 5. Crear Pull Request (PR)
Cuando el equipo termine sus tareas:
- Ve a GitHub/GitLab
- Crea un PR de tu rama a `main`
- Describe los cambios realizados
- Espera revisión del profesor

#### 6. Fusionar (Merge)
El profesor revisará y fusionará los PRs a `main`.

---

## Datos de Configuración

### Configuración de BD en settings.py
La configuración actual de MySQL debe ser:
```python
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'gestion_restaurante',
        'USER': 'root',
        'PASSWORD': 'tu_contraseña',
        'HOST': 'localhost',
        'PORT': '3306',
    }
}
```

**Nota:** Cada desarrollador puede tener diferentes credenciales locales y ajustar `settings.py` según sea necesario (pero NO commitear cambios en credenciales).

---

## Datos de Prueba

**⚠️ IMPORTANTE:** Este proyecto contiene **datos reales del restaurante** (Platos, Alimentos, etc.) que son necesarios para su funcionamiento.

### Compartir Datos de la Base de Datos

#### Opción 1 - Exportar e Importar SQL (Recomendado)

**Paso 1:** El líder del proyecto exporta la BD con datos:
```bash
# En la terminal del servidor MySQL
mysqldump -u root -p gestion_restaurante > backup_datos.sql
```

**Paso 2:** Agregar el backup al repositorio:
```bash
git add backup_datos.sql
git commit -m "Datos iniciales del restaurante"
git push
```

**Paso 3:** Otros desarrolladores importan los datos localmente:
```bash
# Crear BD vacía
mysql -u root -p -e "CREATE DATABASE gestion_restaurante;"

# Importar datos y estructura
mysql -u root -p gestion_restaurante < backup_datos.sql
```

#### Opción 2 - Script Python con Fixtures

Si prefieres mayor control, crear un script `load_initial_data.py`:
```bash
python manage.py loaddata fixtures/platos.json
```

### Resumen del Setup para Cada Desarrollador

1. Clonar repositorio
2. Crear entorno virtual y activar
3. Instalar dependencias
4. Crear BD: `CREATE DATABASE gestion_restaurante;`
5. **Importar datos:** `mysql -u root -p gestion_restaurante < backup_datos.sql`
6. Ejecutar migraciones: `python manage.py migrate`
7. ¡Listo!

Ahora todos tienen los mismos datos de platos, alimentos y relaciones.

---

## Resolver Conflictos de Git

Si dos ramas modifican el mismo archivo:

1. Actualiza tu rama local:
```bash
git pull origin main
```

2. Resuelve conflictos en VS Code (el editor mostrará las diferencias)

3. Confirma los cambios:
```bash
git add .
git commit -m "Merge conflicto resuelto"
```

4. Sube los cambios:
```bash
git push origin feature/tu-rama
```

---

## Comandos Útiles de Django

```bash
# Crear migraciones después de cambiar modelos
python manage.py makemigrations

# Ver migraciones pendientes
python manage.py showmigrations

# Ejecutar migraciones
python manage.py migrate

# Acceder a la consola Django interactiva
python manage.py shell

# Crear superusuario
python manage.py createsuperuser

# Ver estado del proyecto
python manage.py check
```

---

## Preguntas Frecuentes

**P: ¿Qué pasa si modifico archivos del otro equipo?**  
R: Evítalo. Si es necesario, coordina con el otro equipo para hacer los cambios juntos.

**P: ¿Pierdo mis datos locales si hago pull?**  
R: No, solo se actualiza el código. Tu BD local se mantiene.

**P: ¿Necesito crear la BD cada vez que clono?**  
R: Sí, pero importas el `backup_datos.sql` para tener todos los platos y alimentos. Luego corres migraciones.

**P: ¿Qué pasa si la migración no funciona?**  
R: Coordina con el Equipo de Backend. Pueden necesitar revisar la migración.

**P: ¿Y si cambio datos de platos en mi BD local?**  
R: Solo afecta tu BD local. Los cambios en `models.py` sí se commitean (migraciones). Los datos (`INSERT/UPDATE`) NO.

---

## Asignación de Equipos

**EQUIPO SENA (Frontend/Diseño):**
- [Nombre Estudiante 1]
- [Nombre Estudiante 2]
- [Nombre Estudiante 3]

**EQUIPO CESDE (Backend/Lógica):**
- Desarrollador 1 - Lógica de Pedidos: [Nombre]
- Desarrollador 2 - Gestión de Usuarios: [Nombre]
- Desarrollador 3 - Extras/UI Complementaria: [Nombre]

**Profesor:** [Nombre del profesor]

---

**Última actualización:** 15 de Abril de 2026
