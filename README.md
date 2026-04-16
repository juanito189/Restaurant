# Proyecto Restaurant - Guía de Desarrollo Colaborativo

## Descripción
Este es un proyecto Django para la gestión de un restaurante. Se desarrolla en dos equipos paralelos:
- **Equipo SENA**: Diseño/Frontend (3 estudiantes)
- **Equipo CESDE**: Backend/Lógica (3 estudiantes con tareas específicas)

---

## 🚀 PRIMER DÍA - GUÍA RÁPIDA

**⏱️ Tiempo estimado: 20-30 minutos**

### Si eres del Equipo SENA (Frontend):
1. Abre terminal en tu PC
2. Copia y pega esto (todo de una vez):
```bash
git clone https://github.com/juanito189/Restaurant.git
cd Restaurant
python -m venv entorno_restaurante
entorno_restaurante\Scripts\Activate.ps1
pip install -r requirements.txt
git checkout feature/sena
```
3. Abre la carpeta en VS Code
4. Abre Copilot Chat (Ctrl + Shift + I) y pregunta: "Hola, soy del Equipo SENA, ¿qué debo hacer?"
5. Listo, el agente te guiará

### Si eres del Equipo CESDE (Backend):
1. Abre terminal en tu PC
2. Copia y pega esto (todo de una vez):
```bash
git clone https://github.com/juanito189/Restaurant.git
cd Restaurant
python -m venv entorno_restaurante
entorno_restaurante\Scripts\Activate.ps1
pip install -r requirements.txt
git checkout feature/cesde
```
3. **IMPORTANTE:** Configura la BD (solo haz esto UNA vez):
```bash
# En otra terminal, accede a MySQL
mysql -u root -p
# Escribe tu contraseña y luego:
CREATE DATABASE restaurante;
USE restaurante;
source backup_datos.sql
```
4. Vuelve a la terminal del proyecto y corre:
```bash
python manage.py migrate
```
5. Abre la carpeta en VS Code
6. Abre Copilot Chat (Ctrl + Shift + I) y pregunta tu tarea específica
7. Listo

---

## Contexto del Proyecto (Para el Agente)

Hola Claude, soy juanito el creador del proyecto. Este es un proyecto Django para un profesor que pidió hacer un PR en GitHub. Mis compañeros dejaron todo para el último día, así que les asigné tareas específicas. Necesito que ayudes a cada compañero con su tarea:

- **Equipo SENA**: Hacen el frontend (templates, CSS, diseño)
- **Equipo CESDE**: Backen (lógica de pedidos, usuarios, extras)

Todos los datos de platos están en `backup_datos.sql` que ya importé. **Por favor ayuda a mis compañeros a trabajar rápido y claro.** ^^

---

## Requisitos Previos
- Python 3.x
- MySQL instalado y en ejecución
- Git
- Visual Studio Code (recomendado)

## Configuración Detallada (Si necesitas más ayuda)

### 1. Clonar el Repositorio
```bash
git clone https://github.com/juanito189/Restaurant.git
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
*Si marca error de permisos, corre primero:*
```bash
Set-ExecutionPolicy -Scope Process -ExecutionPolicy RemoteSigned
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

### 5. Configurar Base de Datos (SOLO CESDE)

**Abre otra terminal y accede a MySQL:**
```bash
mysql -u root -p
```
Ingresa tu contraseña MySQL, luego:
```sql
CREATE DATABASE restaurante;
USE restaurante;
source backup_datos.sql
```

### 6. Ejecutar Migraciones
```bash
python manage.py migrate
```

### 7. Ejecutar el Servidor (Test)
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
- **Todos trabajan juntos en:**
  - Modificar templates HTML (`gestion/templates/`)
  - Estilos CSS (mejorar interfaz)
  - Diseño de formularios
  - Interfaz de usuario en general

**EQUIPO CESDE - Backend/Lógica:**
- Rama: `feature/cesde`
- **Tres desarrolladores con tareas específicas:**

| Desarrollador | Tarea |
|---|---|
| **Dev 1** | Hacer sistema de **pedidos** - vistas y lógica de compra |
| **Dev 2** | Hacer sistema de **registro/usuarios** - autenticación y perfil |
| **Dev 3** | Hacer **reloj decorativo** + extras visuales en backend |

Todos en la misma rama `feature/cesde` pero trabajando archivos diferentes (sin conflictos).

### Pasos para Trabajar Día a Día

#### 1️⃣ Primer Día - Setup (20-30 min)
Ya lo hiciste con la guía "Primer Día - Guía Rápida" arriba.

#### 2️⃣ Días Siguientes - Desarrollo

```bash
# Asegúrate de estar en tu rama
git branch

# Haz tus cambios en los archivos del IDE

# Confirma tus cambios
git add .
git commit -m "Descripción clara de lo que hiciste"
git push origin feature/sena   # O feature/cesde
```

#### 3️⃣ Cuando Terminen - Pull Request

1. Ve a GitHub: https://github.com/juanito189/Restaurant
2. Busca el botón amarillo "Compare & pull request"
3. Describe qué hizo tu equipo
4. Crea el PR
5. El profesor lo revisa y fusiona

---

## ¿Cómo Usar el Agente de Visual Studio Code?

### ¿Qué es?
Es un asistente AI que lee este README y entiende el proyecto. **Puede ayudarte a resolver problemas rápido.**

### ¿Cómo activarlo?
1. En VS Code, presiona: **Ctrl + Shift + I** (o Cmd + Shift + I en Mac)
2. Se abre un chat a la derecha

### ¿Qué puedes preguntarle?

**Ejemplos buenos:**
- "Hola, soy del Equipo SENA, ¿por dónde empiezo?"
- "Necesito agregar un botón al template de login"
- "¿Cómo hago un commit en git?"
- "No me funciona la migración, ayuda"
- "¿Cuál es mi tarea?" (si eres CESDE)

**Lo que el agente hará:**
✅ Leerá este README automáticamente
✅ Entenderá tu rol (SENA o CESDE)
✅ Te guiará paso a paso
✅ Explicará errores

---

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
