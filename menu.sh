#!/bin/bash
clear
while :
do
    echo " Escoja una opcion "
    echo "1. Alta Usuario"
    echo "2. Baja Usuario"
    echo "3. Modificacion de Usuario"
    echo "4. Estado del sistema"
    echo "5. Salir"
    echo -n "Seleccione una opcion [1 - 5]"
    read opcion
    case $opcion in
        1) echo " Ingrese un nombre de usuario";
        read nombre;
        useradd -m $nombre;
        echo "El usuario $nombre se dio de alta";;
        2) echo "Ingrese el nombre del usuario que quiere dar de baja";
        read nombre;
        userdel -r $nombre;
        echo "El usuario $nombre se dio de baja";;
        3) echo "Ingrese el nombre de usuario que desea modificar";
        read nombre;
        sudo passwd $nombre;
        echo "Al usuario $nombre se le ha modificar la clave";;
        4) top;;
        5) echo "Fin";
        exit ;;
        *) echo "$opcion es una opcion invalida";
        echo "Presiona una tecla para continuar...";
        read foo;;
    esac
done    
