echo "création de l'éxécutable run"
cobc -x -o run main.cbl validate.cbl validate-id.cbl

echo "on éxécute le programme"
./run

echo "on supprime tous les fichier .o"
rm -f *.o