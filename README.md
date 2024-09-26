# Poke Fibo

### By Julio Cons

Caso práctico Flutter.
Su utilizará la pokeapi como el backend para una sencilla aplicación en flutter, el objetivo
es avanzar tanto como sea posible en estos puntos, recordando que se debe usar el
patrón BLoC.


 Al más alto nivel, la app debe tener 2 estados, autenticado y no autenticado. Para
esto se sugiere usar shared preferences y se puede considerar que un usuario
esta registrado una vez su nombre de usuario es guardado persistentemente (se
puede desarrollar un sistema más complejo si así se desea).

---

[x] La primer pantalla o home de la aplicación debe listar a los Pokémon y cuando se
les dé clic deben llevar a su respectiva pantalla de detalle, donde se muestren
estadísticas y habilidades.


[x] En una segunda sección de la aplicación se deben poder administrar equipos de
hasta 6 Pokémon. El nombre del equipo y sus integrantes deben ser almacenados
de manera persistente. Se pude optar por guardar información adicional acerca del
equipo si así se desea. De preferencia se debe poder navegar al detalle de cada
Pokémon.


[x] Se deja a su discreción si esta sección formará parte de una barra de navegación
o algún otro tipo de menú.

[x] Agregar los test que considere necesarios.

[x] Si el usuario esta autenticado (existe en local storage) incluir una pantalla de
bloqueo antes de que pueda pasar al home. La pantalla de bloqueo debe usar
faceID, touchID, su equivalente en Android o en ultima instancia el pin o
contraseña del dispositivo.
El objetivo de este último punto es determinar cual es el nivel de dominio sobre los
flutter channels, sin embargo, el uso de algún paquete o plugin es aceptable.