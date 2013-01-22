#!/bin/bash

# A N
# J B

echo "Witaj w naszym programie!"
echo "Program zgrywa dane z pamieci masowych."
echo "Podaj sciezke dostepu:"
read sciezka

if [ ! -d $sciezka ]
then
	echo 'Sciezka dostepu jest błędna'
	exit 0
fi

echo "Podaj folder docelowy:"
read docelowy

if [ ! -d $docelowy ]
then
        echo "Folder docelowy nie istnieje."
mkdir $docelowy
echo "Gratulujemy. Katalog wlasnie zostal utworzony"
fi

echo "Opcje:"
select wybor in "kopiowanie ze wzgledu na rozmiar." "kopiowanie plikow z danego przedzialu czasu." "aby wyjsc."
do
case $wybor in

"kopiowanie plikow z danego przedzialu czasu.")
echo "Podaj przedzial czasowy:";
echo "format YYYY-MM-DD";
echo "Przedzial od:";
read od;
echo "Przedzial do:";
read doo;
find $sciezka -newermt $od ! -newermt $doo -exec cp '{}' $docelowy \;

;;

"kopiowanie ze wzgledu na rozmiar.")
echo "Podaj maksymalny rozmiar pliku (w kilobajtach):";
read rozmiar;
find $sciezka -size -$rozmiar -exec cp '{}' $docelowy  \;

;;

"aby wyjsc.")
echo "Dziekujemy za skorzystanie z programu.";
echo "Do widzenia.";
exit 0;

;;

*) echo "Bledny wybor!"
esac
break
done
