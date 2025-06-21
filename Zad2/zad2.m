% cps03_trans.m
clear all; close all

% Orthogonal matrix for DCT-IV orthogonal transform
N = 100; % wymiar macierzy kwadratowej, 25, 100
k = (0:N-1); n=(0:N-1); % k-kolumny/funkcje, n-wiersze/probki
A = sqrt(1/N)*exp(-1j*2*pi/N*k'*n); % macierz analizy
S = A'; % macierz syntezy

% S*A, pause % sprawdzenie ortogonalnosci: macierz z jedynkami na przekatnej?

x1 = 10*S(:,5); % sygnal #1
x2 = 20*S(:,10); % sygnal #2

x = real(x1) + imag(x2);

c = A*x; % analiza sygnalu: wyznaczenie wspolczynnikow transformacji

c(5) = 0; % opcjonalne usuniecie skladowej x3 z sygnalu
y = S*c; % synteza sygnalu: suma przeskalowanych funkcji bazowych

error = max(abs(x-y)); % blad odtworzenia/rekonstrukcji sygnalu
disp(['Maksymalny błąd rekonstrukcji: ', num2str(error)]);

figure;
plot(real(x), 'b-o', 'DisplayName', 'Oryginalny sygnał x(n)'); hold on;
plot(real(y), 'r-s', 'DisplayName', 'Odtworzony sygnał y(n)'); grid;
legend;
title('Porównanie oryginalnego i odtworzonego sygnału');
xlabel('Numer próbki n');
ylabel('Amplituda');