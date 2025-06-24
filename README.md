# Cyfrowe-przetwarzanie-sygnałów

#ZAD1 - 1.8

![image](https://github.com/user-attachments/assets/5f0e74c3-acaa-42ba-af89-c2e7624112f7)

![image](https://github.com/user-attachments/assets/546f252d-93e2-4b62-8236-5e0307554404)

1.Wczytuje nagrania które nagrałem za pomocą audioread
2.Miksuje różne pliki przez dodawanie i powstaje x
3.Wyrównanie długości wszystkich plików, wyznaczana jest maksymalna długośc sygnału, który sygnał jest najdłuższy i pliki te są dopełniane zerami aby miały ta samą długość
4.Przeprowadzana jest normalizacja - wykonuje się ją po to aby wartości sygnału nie przekroczyły progu -1, 1. 
5.Testuje

![image](https://github.com/user-attachments/assets/cc2540ac-7bc2-422a-8587-a1764288af36)

Dokonywana jest zmiana częstotliwości próbkowania, Próbkowanie jest to zamiana sygnału analogowego np. muzyki na sygnał cyfrowy - taki który może zrozumieć komputer.
Wg. Twierdzenia Nyquista Częstotliwośc próbkowania musi byc 2x większa od najwyzszej czestosliwości w sygnale aby nie pojawił się aliasing.
Przez to że jeden sygnał został zmniejszony do częstotliwości próbkowania 16 000 to będzie oddtwarzany 3 razy szybciej bo 48 000 / 16 000 = 3

![image](https://github.com/user-attachments/assets/81df7285-7588-4baa-babc-24ebd25fc93b)

Zwiększenie najmniejszej częstotliwości próbkowania.
