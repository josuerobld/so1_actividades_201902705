# **Tipos de Kernel y sus diferencias**

### ¿Que es un Kernel?
Es el núcleo central y esencial del software que actúa como un intermediario entre el hardware de una computadora y el software que se ejecuta en ella. Es una parte fundamental de cualquier sistema operativo, ya que se encarga de gestionar los recursos del sistema y proporcionar una interfaz para que los programas puedan interactuar con el hardware de manera segura y eficiente.
Existen 3 principales tipos de kernel: 
- Kernel Monolítico
- Kernel Microkernel
- Kernel híbrido

### Kernel Monolítico
Es el tipo de kernel más antiguo y ampliamente utilizado.
Todas las funciones esenciales del sistema operativo, como la gestión de procesos, la gestión de memoria, el sistema de archivos, etc., se encuentran en un solo bloque de código.
Las interrupciones del kernel se manejan en un espacio de memoria privilegiado y, por lo tanto, el kernel tiene acceso directo a todas las áreas de memoria y recursos del sistema.
Algunos ejemplos de sistemas operativos con kernel monolítico son Linux (en su mayoría), Windows (hasta cierto punto) y macOS (en su núcleo XNU).

### Kernel Microkernel
En este enfoque, el kernel solo contiene las funciones más básicas y esenciales, como la gestión de memoria y la planificación de procesos.
Las funciones no esenciales se implementan como procesos que se ejecutan en modo usuario.
El intercambio de mensajes se utiliza para comunicarse entre los servicios del sistema, lo que reduce la complejidad y aumenta la seguridad y estabilidad del sistema.
Algunos ejemplos de sistemas operativos con kernel microkernel son QNX y MINIX.

### Kernel Híbrido
El kernel híbrido es una combinación del kernel monolítico y el microkernel, lo que resulta en un núcleo más compacto y flexible. En esta configuración, el kernel más grande se optimiza y permite la carga dinámica de otras partes del kernel. Este enfoque se aplica actualmente en sistemas operativos como Linux y OS X.
En esencia, un núcleo híbrido se basa en un micronúcleo con ciertas porciones de código consideradas "no esenciales" que se mantienen en el espacio del núcleo para mejorar su rendimiento en comparación con una ubicación en el espacio de usuario. Este enfoque fue adoptado por muchos desarrolladores en los primeros sistemas operativos basados en micronúcleo antes de que se demostrara que los micronúcleos también podían tener un buen rendimiento.

Muchas veces se confunde erróneamente el concepto de núcleo híbrido con los núcleos monolíticos que pueden cargar dinámicamente módulos después del arranque. La distinción clave del núcleo híbrido es que combina elementos de diseño tanto del enfoque monolítico como del micronúcleo, específicamente haciendo uso de mecanismos de paso de mensajes y migrando ciertas partes no importantes del código hacia el espacio de usuario, aunque aún mantiene ciertas partes de código que no son imporantes en el propio núcleo por razones de rendimiento.

| Microkernel                           | Kernel Híbrido                          | Monolítico                          |
|---------------------------------------|-----------------------------------------|-------------------------------------|
| Diseño minimalista con funciones esenciales en el espacio del núcleo	| Combinación de características de	 microkernel y monolítico en un solo núcleo | Todas las funciones del sistema están integradas en un solo bloque de codigo.
| Potencialmente menor rendimiento	debido a la comunicación entre espacios de usuario.| Mejor rendimiento que el microkernel,	pero puede ser menor que un núcleo	monolítico optimizado.| Potencialmente mejor rendimiento debido a su diseño integrado y acceso directo a recursos. |
| Mayor seguridad y estabilidad debido a la separación de servicios y aislamiento de fallos. | Mayor flexibilidad para adaptarse a	diferentes necesidades del sistema.	| Mayor rendimiento y acceso directo a recursos del sistema.|

# **User vs Kernel Mode**

El User Mode (modo usuario) y el Kernel Mode (modo kernel) son dos modos de operación distintos en los que se ejecutan los programas y procesos en un sistema operativo. La diferencia clave entre ambos radica en los niveles de privilegios y los recursos del sistema a los que pueden acceder.

### User Mode (Modo Usuario)
En el User Mode, los programas y aplicaciones de usuario se ejecutan con privilegios limitados.
Los programas en este modo no tienen acceso directo al hardware o a la memoria del sistema y deben comunicarse con el kernel para solicitar cualquier operación que requiera permisos especiales.
El modo usuario proporciona un ambiente seguro y aislado para las aplicaciones, ya que evita que un programa malicioso pueda acceder a áreas críticas del sistema o causar daños.
Si un programa intenta realizar una operación que requiere privilegios de kernel, se genera una interrupción para que el kernel lo maneje apropiadamente.

### Kernel Mode (Modo Kernel)
El Kernel Mode, también conocido como modo supervisor o modo privilegiado, es un nivel más alto de privilegios que el modo usuario.
El kernel del sistema operativo se ejecuta en este modo y tiene acceso completo a todos los recursos del sistema, como el hardware, la memoria y los controladores.
Dado que el kernel opera en modo privilegiado, puede realizar tareas críticas de gestión y control, como el cambio de contexto de un proceso, la asignación de memoria y la gestión de interrupciones del hardware.
Es importante que el kernel esté protegido y bien diseñado para evitar que aplicaciones maliciosas o con errores accedan directamente a su espacio de memoria y corrompan el sistema.