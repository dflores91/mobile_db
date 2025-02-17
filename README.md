# Mobile Coding Challenge

Esta es una aplicación móvil desarrollada con Flutter que permite a los usuarios explorar y gestionar una lista de películas. La aplicación incluye funcionalidades como búsqueda de películas, visualización de detalles, y gestión de una lista de deseos.

## Características

- **Explorar películas**: Navega por las películas más populares, las que están en cartelera, las mejor valoradas y las próximas a estrenarse.
- **Buscar películas**: Utiliza la barra de búsqueda para encontrar tus películas favoritas.
- **Detalles de la película**: Visualiza información detallada sobre cada película, incluyendo el título, la sinopsis, la fecha de lanzamiento y los géneros.
- **Lista de deseos**: Añade películas a tu lista de deseos para verlas más tarde.

## Instalación

1. Clona el repositorio:
    ```sh
    git clone https://github.com/tu_usuario/mobile_coding_challenge.git
    ```
2. Navega al directorio del proyecto:
    ```sh
    cd mobile_coding_challenge
    ```
3. Instala las dependencias:
    ```sh
    flutter pub get
    ```
4. Actualizar el archivo injectable
    ```sh
    flutter pub run build_runner build --delete-conflicting-outputs
    ```

## Ejecución

Para ejecutar la aplicación en un emulador o dispositivo físico, utiliza el siguiente comando:
```sh
flutter run
```

## Estructura del Proyecto

- **lib**: Contiene el código fuente de la aplicación.
- **app/**: Contiene la configuración de la aplicación y los widgets compartidos.
- **home/**: Contiene las pantallas principales de la aplicación (inicio, búsqueda, lista de deseos).
assets: Contiene los recursos estáticos como imágenes y archivos de configuración.

## Dependencias
La aplicación utiliza las siguientes dependencias principales:

- flutter_bloc: Para la gestión del estado.
- dio: Para las solicitudes HTTP.
- get_it: Para la inyección de dependencias.
- intl: Para la internacionalización.
- flutter_i18n: Para el manejo de idiomas (es, en)
- shared_preferences: Para el almacenamiento local.

## Preguntas Adicionales
- ¿Cuánto tiempo dedicaste a esto?

    Dediqué aproximadamente 7 horas y media a este proyecto.

- ¿Completaste tu implementación?

    Sí, completé la implementación de todas las funcionalidades principales.

- ¿Qué habrías añadido si tuvieras más tiempo?

    Si tuviera más tiempo, añadiría el dark mode, un login y una clase para gestion de errores con ayuda de la implementación de dio.

- ¿Cuál fue la parte más difícil de la aplicación?

    La parte más difícil fue la integración de una API y la gestión de las imagenes por el uso de una segunda url.

- ¿Cuál fue tu parte favorita de la aplicación?

    Mi parte favorita fue el diseño de la interfaz, la implementación de una funcionalidad del wishlist local y la función de busqueda.

- ¿Hay algo más que te gustaría añadir?

    El reto fue bastante interesante y me parecio bastante entretenido, sin duda disfrute realizar esta aplicación.

