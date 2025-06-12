echo "création de l'éxécutable run"

ocesql insert.cbl insert.cob
ocesql main_sql.cbl main_sql.cob
cobc -locesql -x -o run main_sql.cob insert.cob

echo "on éxécute le programme"
./run

echo "on supprime tous les fichier .cob"
rm -f *.cob