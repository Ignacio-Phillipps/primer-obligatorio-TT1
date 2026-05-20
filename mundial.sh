#!/bin/bash

ARCHIVO="datos_mundial.txt"
touch "$ARCHIVO"

opcion=0

while [ "$opcion" != "8" ]
do

echo "                     "
echo "Bienvenido al mundial"
echo "                    "
echo "1 - listar equipos"
echo "2 - mostrar campeon actual"
echo "3 - registrar equipo"
echo "4 - registrar partido"
echo "5 - ver historial de partidos"
echo "6 - buscar equipo"
echo "7 - cantidad de partidos jugados"
echo "8 - salir"

echo "ingrese una opcion"
echo "                  "

read opcion

if [ "$opcion" = "1" ]; then
echo "equipos registrados:"
grep "equipo" "$ARCHIVO"

elif [ "$opcion" = "2" ]; then
grep "campeon actual:" "$ARCHIVO"

elif [ "$opcion" = "3" ]; then

cantidad=$(grep -c "equipo" "$ARCHIVO")
if [ "$cantidad" -ge 15 ]; then
echo "advertencia: mas de 15 equipos registrados"
fi
 
echo "ingrese el nombre del equipo"
read equipo

if [ "$equipo" = "" ]; then
echo "no se permiten valores vacios"
else
echo "equipo $equipo" >> "$ARCHIVO" 
echo "equipo guardado correctamente"

fi

elif [ "$opcion" = "4" ]; then

echo "ingrese equipo 1:"
read equipo1

echo "ingrese goles de $equipo1:"
read goles1

echo "ingrese equipo 2:"
read equipo2

echo "ingrese goles de $equipo2:"
read goles2

if [ "$equipo1" = "" ] ||  ["$equipo2" = "" ]; then
echo "no se permiten valores vacios"

else
 
echo "partido $equipo1 $goles1 $equipo2 $goles2" >> "$ARCHIVO"
echo "partido guardado correctamente"

fi

elif [ "$opcion" = "5" ]; then

if grep "partido" "$ARCHIVO"; then

echo "historial de partidos: "

else
echo "no hay partidos registrados"

fi

elif [ "$opcion" = "6" ]; then

echo "ingrese el nombre del equipo"
read buscar

if [ "$buscar" = "" ]; then
echo "no se permiten valores vacios"

elif grep "equipo $buscar" "$ARCHIVO"; then
echo "equipo registrado"

else
echo "equipo no registrado"

fi

elif [ "$opcion" = "7" ]; then

echo "cantidad de partidos jugados:"
grep -c "partido" "$ARCHIVO"

elif [ "$opcion" = "8" ]; then
echo "fin"

else 
echo "opcion incorrecta"

fi

done
