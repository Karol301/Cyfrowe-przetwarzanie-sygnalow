# Cyfrowe-przetwarzanie-sygnałów

#ZAD1 - 1.8

![image](https://github.com/user-attachments/assets/5f0e74c3-acaa-42ba-af89-c2e7624112f7)

CZ.1

1.Wczytuje nagrania które nagrałem za pomocą audioread

2.Miksuje różne pliki przez dodawanie i powstaje x

3.Wyrównanie długości wszystkich plików, wyznaczana jest maksymalna długośc sygnału, który sygnał jest najdłuższy i pliki te są dopełniane zerami aby miały ta samą długość

4.Przeprowadzana jest normalizacja - wykonuje się ją po to aby wartości sygnału nie przekroczyły progu -1, 1. 

5.Testuje

CZ.2
Dokonywana jest zmiana częstotliwości próbkowania, Próbkowanie jest to zamiana sygnału analogowego np. muzyki na sygnał cyfrowy - taki który może zrozumieć komputer.

Wg. Twierdzenia Nyquista Częstotliwośc próbkowania musi byc 2x większa od najwyzszej czestosliwości w sygnale aby nie pojawił się aliasing.

Przez to że jeden sygnał został zmniejszony do częstotliwości próbkowania 16 000 to będzie oddtwarzany 3 razy szybciej bo 48 000 / 16 000 = 3

CZ.3
Zwiększenie najmniejszej częstotliwości próbkowania.

#ZAD2 - 4.4

![image](https://github.com/user-attachments/assets/836ec58e-c733-483f-a2f4-3a415b45147d)

TEORIA:

DFT - umozliwia przekształcenie sygnału w dziedzinie czasu do dziedziny częstotliwości, wykorzystuje się macierz analizy A

IDFT - umozliwia operację odwrotną do DFT, wykorzystuje do przekształcenia macierz syntezy S

Analiza - c = A * x
Synteza - x = S * c

1.Generowana jest macierz analizy A tak jak w zadaniu 1

2.Generowana jest macierz syntezy S jako macierz transponowana

3.Tworzony jest sygnał jako suma części rzeczywistej i urojonej x

4.Wykonywana jest analiza, później usuwa się część składowej widma

5.Rekontrukcja sygnału, przekształcenie na sygnał czasowy

#ZAD3 - 9.2

![image](https://github.com/user-attachments/assets/7ad7c9c7-66d4-43d1-ab00-514deaadf3e0)
![image](https://github.com/user-attachments/assets/6b5ba045-a832-4c68-a5e7-25df67a53c05)

#1
Tworzone są idelne odpowiedzi filtrów, na takie odpowiedzi impulsowe nakładane są okna, np. okno czybyszewa, tłumienie listków bocznych o 100 oznacza że amplituda pierwszego listka bocznego będzie o 100dB mniejsza od głównego.

Tak naprawde intersuje nas do 1000Hz, jest to związane z częstotliwością nyquista 2000/2

#2
Zmiana Rs - powoduje zmianę poziomu listków bocznych, im mniejsze Rs tym wyższe listki boczne to znaczy że będzie słabsze tłumienie w paśmie zaporowym

#2
Zamiana M - wpływa na szerokośc zbocza i tłumienie w pąśmie zaporowym. Im większe M to jest bardziej strome przejście do pasma zaporowego, głębsze i dokłądniejsze tłumienie w paśmie zaporowym. 

#4
Okna Hanniga ~-44dB i Blackmana ~-74dB nie sa oknami które da się regulować tak jak Kaiser i Chebyshev, mają one stałe tłumienie boczne 


#ZAD4 - lab 10 zad 3

![image](https://github.com/user-attachments/assets/fe70ef2e-dd13-4a38-a341-dc04766ffd16)

Filtr odwrócony, zmaiana licznika z mianownikiem. Resztka to różnica miedzy tym co przewidzielismy a tym co jest faktycznie.
