clear all; close all; clc;

% Parametry
fpr = 2000;         % Częstotliwość próbkowania
f1 = 400;           % Dolna granica pasma zaporowego
f2 = 600;           % Górna granica pasma zaporowego
Rs = 100;           % Tłumienie bocznych listków (stałe)

% Różne długości filtra (wartości M)
M_values = [20, 40, 100, 200];

% Przygotuj wykres
figure; hold on; grid on;
title('Charakterystyki amplitudowe filtra BS dla różnych długości (Rs = 100 dB)');
xlabel('Częstotliwość [Hz]');
ylabel('Amplituda [dB]');

for i = 1:length(M_values)
    M = M_values(i);
    N = 2*M + 1;
    n = -M:M;

    % Odpowiedź impulsowa idealna Band-Stop
    hALL = zeros(1,N); hALL(M+1) = 1;
    hLP1 = sin(2*pi*f1/fpr*n)./(pi*n); hLP1(M+1) = 2*f1/fpr;
    hLP2 = sin(2*pi*f2/fpr*n)./(pi*n); hLP2(M+1) = 2*f2/fpr;
    hBP  = hLP2 - hLP1;
    hBS  = hALL - hBP;

    % Okno Czebyszewa (Rs = 100 dB)
    w = chebwin(N, Rs)';
    b = hBS .* w;

    % FFT
    Nfft = 4096;
    H = fft(b, Nfft);
    H = fftshift(H);
    f = (-Nfft/2:Nfft/2-1)*(fpr/Nfft);

    % Dodatnie częstotliwości
    idx = f >= 0;
    plot(f(idx), 20*log10(abs(H(idx)) + eps), 'DisplayName', ['M = ' num2str(M)]);
end

legend('show');
ylim([-120 5]);
