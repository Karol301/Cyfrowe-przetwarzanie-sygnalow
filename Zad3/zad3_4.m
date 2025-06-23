clear all; close all; clc;

% Parametry filtra
fpr = 2000;        % Częstotliwość próbkowania
f1 = 400;          % Pasmo BS dolne
f2 = 600;          % Pasmo BS górne
M = 100;           % Połowa długości filtra
N = 2*M + 1;       % Długość filtra
n = -M:M;

% Odpowiedź impulsowa idealnego filtra BS
hALL = zeros(1,N); hALL(M+1) = 1;
hLP1 = sin(2*pi*f1/fpr*n)./(pi*n); hLP1(M+1) = 2*f1/fpr;
hLP2 = sin(2*pi*f2/fpr*n)./(pi*n); hLP2(M+1) = 2*f2/fpr;
hBP  = hLP2 - hLP1;
hBS  = hALL - hBP;

% Definicje okien
Rs = 100;                   % dla chebwin
beta = 8.6;                 % dla kaiser() - dla ~100 dB
okna = {
    chebwin(N, Rs)', 'Chebyshev';
    hanning(N)',     'Hanning';
    blackman(N)',    'Blackman';
    kaiser(N, beta)', 'Kaiser'
};

% Przygotuj wykres
figure; hold on; grid on;
title('Charakterystyki amplitudowe filtra BS dla różnych okien');
xlabel('Częstotliwość [Hz]');
ylabel('Amplituda [dB]');

for i = 1:size(okna,1)
    w = okna{i,1};            % Okno
    label = okna{i,2};        % Etykieta

    b = hBS .* w;             % Wagi filtra

    % Odpowiedź częstotliwościowa
    Nfft = 4096;
    H = fft(b, Nfft);
    H = fftshift(H);
    f = (-Nfft/2:Nfft/2-1)*(fpr/Nfft);

    % Pokaż tylko dodatnie częstotliwości
    idx = f >= 0;
    plot(f(idx), 20*log10(abs(H(idx)) + eps), 'DisplayName', label);
end

legend('show');
ylim([-120 5]);
