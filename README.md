# Cyfrowe-przetwarzanie-sygnałów

#ZAD1 - 1.8

![image](https://github.com/user-attachments/assets/5f0e74c3-acaa-42ba-af89-c2e7624112f7)

![image](https://github.com/user-attachments/assets/81df7285-7588-4baa-babc-24ebd25fc93b)

1.Wczytuje nagrania które nagrałem za pomocą audioread
2.Miksuje różne pliki przez dodawanie i powstaje x
3.Wyrównanie długości wszystkich plików, wyznaczana jest maksymalna długośc sygnału, który sygnał jest najdłuższy i pliki te są dopełniane zerami aby miały ta samą długość
4.Przeprowadzana jest normalizacja - wykonuje się ją po to aby wartości sygnału nie przekroczyły progu -1, 1. 
5.Testuje

![image](https://github.com/user-attachments/assets/cc2540ac-7bc2-422a-8587-a1764288af36)

Dokonywana jest zmiana częstotliwości próbkowania, Próbkowanie jest to zamiana sygnału analogowego np. muzyki na sygnał cyfrowy - taki który może zrozumieć komputer.
Wg. Twierdzenia Nyquista Częstotliwośc próbkowania musi byc 2x większa od najwyzszej czestosliwości w sygnale aby nie pojawił się aliasing.
Przez to że jeden sygnał został zmniejszony do częstotliwości próbkowania 16 000 to będzie oddtwarzany 3 razy szybciej bo 48 000 / 16 000 = 3

![image](https://github.com/user-attachments/assets/546f252d-93e2-4b62-8236-5e0307554404)

Zwiększenie najmniejszej częstotliwości próbkowania.

#ZAD2 - 4.4

![image](https://github.com/user-attachments/assets/836ec58e-c733-483f-a2f4-3a415b45147d)

TEORIA:
DFT - umozliwia przekształcenie sygnału w dziedzinie czasu do dziedziny częstotliwości, wykorzystuje się macierz analizy A
IDFT - umozliwia operację odwrotną do DFT, wykorzystuje do przekształcenia macierz syntezy S

Analiza - c = A * x
Synteza - x = S * c

![image](https://github.com/user-attachments/assets/09ff39c5-b92b-4d12-82b9-c49fa5fc9afd)

1.Generowana jest macierz analizy A tak jak w zadaniu 1
2.Generowana jest macierz syntezy S jako macierz transponowana
3.Tworzony jest sygnał jako suma części rzeczywistej i urojonej x
4.Wykonywana jest analiza, później usuwa się część składowej widma
5.Rekontrukcja sygnału, przekształcenie na sygnał czasowy

#ZAD3 - 9.2

![image](https://github.com/user-attachments/assets/7ad7c9c7-66d4-43d1-ab00-514deaadf3e0)
![image](https://github.com/user-attachments/assets/6b5ba045-a832-4c68-a5e7-25df67a53c05)



