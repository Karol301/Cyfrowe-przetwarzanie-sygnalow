%% Zastosowanie wag filtra, współczynniki wagowe filtra BS
clear all; close all; clc;

% Parametry
fpr = 2000;         % Częstotliwość próbkowania
f0 = 100;           % Graniczna LP / HP
f1 = 400;           % Pasmo BP/BS dolne
f2 = 600;           % Pasmo BP/BS górne
M = 100;            % Połowa długości filtra
N = 2*M + 1;        % Długość filtra
n = -M:1:M;         % Indeksy filtra
Nx = 2000;          % Liczba próbek sygnału
dt = 1/fpr;         
t = dt*(0:Nx-1);    % Oś czasu

% SYGNAŁ wejściowy: suma dwóch sinusoid
x = sin(2*pi*20*t + pi/3) + sin(2*pi*500*t + pi/7);

% ODPOWIEDZI IMPULSOWE
hALL = zeros(1,N); hALL(M+1)=1;                             % All-pass
hLP  = sin(2*pi*f0/fpr*n)./(pi*n); hLP(M+1)  = 2*f0/fpr;    % Low-pass
hHP  = hALL - hLP;                                          % High-pass
hLP1 = sin(2*pi*f1/fpr*n)./(pi*n); hLP1(M+1) = 2*f1/fpr;    % Low-pass dla f1
hLP2 = sin(2*pi*f2/fpr*n)./(pi*n); hLP2(M+1) = 2*f2/fpr;    % Low-pass dla f2
hBP  = hLP2 - hLP1;                                         % Band-pass
hBS  = hALL - hBP;                                          % Band-stop – przepuszcza wszystko poza [f1,f2]

% FILTRY do testu
filters = {'Low-pass', 'High-pass', 'Band-pass', 'Band-stop'};
hList = {hLP, hHP, hBP, hBS};

for k = 1:4
    % Pobierz odpowiedź impulsową i nałóż okno Czebyszewa (-100 dB)
    b = hList{k} .* chebwin(N, 100)';

    % Wykres wag filtra
    figure;
    stem(n, b, 'filled'); title(['Wagi filtra: ' filters{k}]); xlabel('n'); grid;

    % Filtracja przez splot FIR
    y = zeros(1,Nx);
    bx = zeros(1,N);
    for i = 1:Nx
        bx = [ x(i) bx(1:N-1) ];
        y(i) = sum(bx .* b);
    end

    % SYGNAŁY: Wejście i wyjście
    figure;
    subplot(2,1,1); plot(t, x); title('Sygnał wejściowy x(n)'); grid;
    subplot(2,1,2); plot(t, y); title(['Sygnał po filtrze: ' filters{k}]); grid;

    % WIDMA: FFT drugich połówek
    kf = Nx/2+1:Nx;
    f0_fft = fpr/(Nx/2);
    f = f0_fft * (0:Nx/2-1);
    Y = abs(2*fft(y(kf))/(Nx/2));
    X = abs(2*fft(x(kf))/(Nx/2));

    figure;
    subplot(2,1,1);
    plot(f, 20*log10(X)); title('Widmo sygnału wejściowego'); xlabel('f [Hz]'); grid;
    subplot(2,1,2);
    plot(f, 20*log10(Y)); title(['Widmo sygnału wyjściowego - ' filters{k}]); xlabel('f [Hz]'); grid;
end
