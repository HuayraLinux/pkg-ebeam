# Pizarra Digital Ebeam Edge

Estos paquetes son un "reempaquetado" del original de Luidia que están hechos para versiones de Ubuntu.
Contienen los drivers para que el lápiz funcione como puntero de mouse. Y la aplicación para dibujar
sobre el escritorio. Están desarrollados para que funcionen sobre Huayra 3.x

Lamentablemente es todos software privativo y de 32bits.

El paquete pretende ser multiarch, para instalarlo en sistemas de 64bits se tiene que agregar la arquitectura de i386

$ dpkg --add-architecture i386

luego:

$ sudo apt-get install ebeam-diva ebeam-interact

El paquete está en estapa de desarrollo y todavía no esta completo el 100% de funcionalidad.



