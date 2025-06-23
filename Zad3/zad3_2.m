clear all; close all; clc;

% Parametry filtra i sygnału
fpr = 2000;         % Częstotliwość próbkowania
f1 = 400;           % Dolna granica pasma zaporowego
f2 = 600;           % Górna granica pasma zaporowego
M = 100;            % Połowa długości filtra
N = 2*M + 1;        % Długość filtra
n = -M:M;           % Indeksy

% Odpowiedź impulsowa idealnego filtra Band-Stop
hALL = zeros(1,N); hALL(M+1)=1;
hLP1 = sin(2*pi*f1/fpr*n)./(pi*n); hLP1(M+1) = 2*f1/fpr;
hLP2 = sin(2*pi*f2/fpr*n)./(pi*n); hLP2(M+1) = 2*f2/fpr;
hBP  = hLP2 - hLP1;
hBS  = hALL - hBP;  % Band-Stop

% Różne wartości tłumienia bocznych listków w oknie Czebyszewa
Rs_values = [60, 80, 100, 120];

% Przygotuj wykres
figure; hold on; grid on;
title('Charakterystyki amplitudowe filtra BS z oknem Czebyszewa');
xlabel('Częstotliwość [Hz]');
ylabel('Amplituda [dB]');

for i = 1:length(Rs_values)
    Rs = Rs_values(i);
    w = chebwin(N, Rs)';        % Okno Czebyszewa
    b = hBS .* w;               % Wagi filtra z oknem

    % FFT i oś częstotliwości
    Nfft = 2048;
    H = fft(b, Nfft);
    H = fftshift(H);
    f = (-Nfft/2:Nfft/2-1)*(fpr/Nfft);

    % Wyświetl tylko dodatnie częstotliwości
    idx = f >= 0;
    plot(f(idx), 20*log10(abs(H(idx)) + eps), 'DisplayName', ['Rs = ' num2str(Rs) ' dB']);
end

legend('show');
ylim([-120 5]);
