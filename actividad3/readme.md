## Parte 1: Gestión de Usuarios
1. Creación de Usuarios: Crea tres usuarios llamados `usuario1`, `usuario2` y `usuario3`.

INPUT:
  ~~~
    sudo useradd usuario1
    sudo useradd usuario2
    sudo useradd usuario3
  ~~~
OUTPUT:
 ~~~
Añadiendo el usuario `usuario1' ...
Añadiendo el nuevo grupo `usuario1' (1001) ...
Añadiendo el nuevo usuario `usuario1' (1001) con grupo `usuario1' ...
Creando el directorio personal `/home/usuario1' ...
Copiando los ficheros desde `/etc/skel' ...
Nueva contraseña: 
Vuelva a escribir la nueva contraseña: 
Cambiando la información de usuario para usuario1
Introduzca el nuevo valor, o presione INTRO para el predeterminado
	Nombre completo []: 
	Número de habitación []: 
	Teléfono del trabajo []: 
	Teléfono de casa []: 
	Otro []: 
¿Es correcta la información? [S/n] 
 ~~~
2. Asignación de Contraseñas: Establece una nueva contraseñas para cada usuario creado.

INPUT:
~~~
sudo passwd usuario1
sudo passwd usuario2
sudo passwd usuario3
~~~
OUTPUT:
~~~
Nueva contraseña: 
Vuelva a escribir la nueva contraseña: 
passwd: contraseña actualizada correctamente
~~~
4. Información de Usuarios: Muestra la información de `usuario1` usando el comando `id`.

INPUT:
~~~
id usuario1
~~~
OUTPUT:
~~~
uid=1001(usuario1) gid=1001(usuario1) grupos=1001(usuario1)
~~~

6. Eliminación de Usuarios: Elimina `usuario3`, pero conserva su directorio principal.

INPUT:
~~~
sudo mkdir /home/usuarios_backup
sudo mv /home/usuario3 /home/usuarios_backup/
sudo userdel usuario3
~~~
OUTPUT:
~~~
Buscando archivos para guardar/eliminar ...
Eliminando archivos ...
Eliminando al usuario `usuario3' ...
~~~

## Parte 2: Gestión de Grupos

1. Creación de Grupos: Crea dos grupos llamados `grupo1` y `grupo2`.

~~~
sudo groupadd  grupo1
sudo groupadd  grupo2
~~~
OUTPUT:
~~~
Añadiendo el grupo `grupo1' (GID 1003) ...
Hecho.
~~~

3. Agregar Usuarios a Grupos: Agrega `usuario1` a `grupo1` y `usuario2` a `grupo2`.

~~~
sudo usermod -aG grupo1 usuario1
sudo usermod -aG grupo2 usuario2
~~~
OUTPUT:
~~~
Añadiendo al usuario `usuario1' al grupo `grupo1' ...
Añadiendo al usuario usuario1 al grupo grupo1
Hecho.
~~~

5. Verificar Membresía: Verifica que los usuarios han sido agregados a los grupos utilizando el comando `groups`.

~~~
groups usuario1
groups usuario2
~~~
OUTPUT:
~~~
usuario1 : usuario1 grupo1
~~~

7. Eliminar Grupo: Elimina `grupo2`.

~~~
sudo delgroup grupo2
~~~
OUTPUT:
~~~
Eliminando al grupo `grupo2' ...
Hecho.
~~~

## Parte 3: Gestión de Permisos

1. Creación de Archivos y Directorios:

    Como `usuario1`, crea un archivo llamado `archivo1.txt` en su directorio principal y escribe algo en él.
    Crea un directorio llamado `directorio1` y dentro de ese directorio, un archivo llamado `archivo2.txt`.

~~~
su usuario1
echo "contenido" > ~/archivo1.txt
mkdir ~/directorio1
cd ~/directorio1
touch archivo2.txt
~~~

3. Verificar Permisos: Verifica los permisos del archivo y directorio usando el comando `ls -l` y `ls -ld` respectivamente.

~~~
ls -l ~/archivo1.txt
ls -ld ~/directorio1
ls -ld ~/directorio1/archivo2.txt
~~~
OUTPUT:
~~~
-rw-rw-r-- 1 usuario1 usuario1 16 ago  9 22:31 /home/usuario1/archivo1.txt
drwxrwxr-x 2 usuario1 usuario1 4096 ago  9 22:35 /home/usuario1/directorio1
~~~

5. Modificar Permisos usando `chmod` con Modo Numérico: Cambia los permisos del `archivo1.txt` para que sólo `usuario1` pueda leer y escribir (permisos `rw-`), el grupo pueda leer (permisos `r--`) y nadie más pueda hacer nada.

~~~
chmod 640 ~/archivo1.txt
~~~

6. Modificar Permisos usando `chmod` con Modo Simbólico: Agrega permiso de ejecución al propietario del `archivo2.txt`.

~~~
chmod u+x ~/directorio1/archivo2.txt
~~~

7. Cambiar el Grupo Propietario: Cambia el grupo propietario de `archivo2.txt` a `grupo1`.

~~~
sudo chown :grupo1 ~/directorio1/archivo2.txt
~~~

8. Configurar Permisos de Directorio: Cambia los permisos del `directorio1` para que sólo el propietario pueda entrar (permisos `rwx`), el grupo pueda listar contenidos pero no entrar (permisos `r--`), y otros no puedan hacer nada.

~~~
chmod 750 ~/directorio1
~~~

9. Comprobación de Acceso: Intenta acceder al `archivo1.txt` y `directorio1/archivo2.txt` como `usuario2`. Nota cómo el permiso de directorio afecta el acceso a los archivos dentro de él.

~~~
su usuario2
cat ~usuario1/archivo1.txt
cat ~usuario1/directorio1/archivo2.txt
~~~
OUTPUT:
~~~
cat: usuario1/archivo1.txt: Permiso denegado
~~~

10. Verificación Final: Verifica los permisos y propietario de los archivos y directorio nuevamente con `ls -l` y `ls -ld`.

~~~
ls -l ~usuario1/archivo1.txt
ls -ld ~usuario1/directorio1
ls -l ~usuario1/directorio1/archivo2.txt
~~~
OUTPUT:
~~~
-rw-r----- 1 usuario1 usuario1 16 ago  9 22:31 /home/usuario1/archivo1.txt
drwxr-x--- 2 usuario1 usuario1 4096 ago  9 22:35 /home/usuario1/directorio1
~~~
