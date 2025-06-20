clear all; close all;

[x1, Fs1] = audioread('plik1.wav');
[x2, Fs2] = audioread('plik2.wav');
[x3, Fs3] = audioread('plik3.wav');

%% Dodanie do siebie nagrań z tą samą częstotliwością próbkowania
disp("Nagrania z tą samą częstotliwością próbkowania:")
disp(['Częstotliwość próbkowania nagrania 1: ', num2str(Fs1), ' Hz']);
%sound(x1, Fs1);
%pause;
disp(['Częstotliwość próbkowania nagrania 2: ', num2str(Fs2), ' Hz']);
%sound(x2, Fs2);
%pause;
disp(['Częstotliwość próbkowania nagrania 3: ', num2str(Fs3), ' Hz']);
%sound(x3, Fs3);
%pause;

max_len = max([length(x1), length(x2), length(x3)]);

x1(end+1:max_len, :) = 0;
x2(end+1:max_len, :) = 0;
x3(end+1:max_len, :) = 0;

% Dodanie sygnałów
x = x1 + x2 + x3;

% Normalizacja
x = x / max(abs(x(:)));

disp('Odtwarzanie zmiksowanego sygnału:');
%sound(x, Fs1);
%pause;

%% Test dla nagrań o różnych częstotliwościach próbkowania
disp("-----------------------------------------------")
disp("Nagrania z różną częstotliwością próbkowania:")

Fs1_new = 16000;
Fs2_new = 44100;
x1_res = resample(x1, Fs1_new, Fs1);
x2_res = resample(x2, Fs2_new, Fs2);  
x3_res = x3;

disp(['Częstotliwość próbkowania nagrania 1: ', num2str(Fs1_new), ' Hz']);
%sound(x1_res, Fs1_new);
%pause;
disp(['Częstotliwość próbkowania nagrania 2: ', num2str(Fs2_new), ' Hz']);
%sound(x2_res, Fs2_new);
%pause;
disp(['Częstotliwość próbkowania nagrania 3: ', num2str(Fs3), ' Hz']);
%sound(x3_res, Fs3);
%pause;

max_len = max([length(x1_res), length(x2_res), length(x3_res)]);

x1_res(end+1:max_len, :) = 0;
x2_res(end+1:max_len, :) = 0;
x3_res(end+1:max_len, :) = 0;

% Dodanie sygnałów
x_res = x1_res + x2_res + x3_res;

% Normalizacja
x_res = x_res / max(abs(x_res(:)));

disp('Odtwarzanie zmiksowanego sygnału:');
%sound(x_res, 48000);
%pause;

%% Zwiększanie mniejszej częstotliwości
disp("-----------------------------------------------")
disp("Nagrania po zwiększeniu najmniejszej częstotliwości próbkowania:")
Fs1_change = 40000;
x1_change = resample(x1_res, Fs1_change, Fs1_new);

disp(['Częstotliwość próbkowania nagrania 1: ', num2str(Fs1_change), ' Hz']);
sound(x1_change, Fs1_change);
pause;
disp(['Częstotliwość próbkowania nagrania 2: ', num2str(Fs2_new), ' Hz']);
sound(x2_res, Fs2_new);
pause;
disp(['Częstotliwość próbkowania nagrania 3: ', num2str(Fs3), ' Hz']);
sound(x3_res, Fs3);
pause;

max_len = max([length(x1_change), length(x2_res), length(x3_res)]);

x1_change(end+1:max_len, :) = 0;
x2_res(end+1:max_len, :) = 0;
x3_res(end+1:max_len, :) = 0;

% Dodanie sygnałów
x_change = x1_change + x2_res + x3_res;

% Normalizacja
x_change = x_change / max(abs(x_change(:)));

disp('Odtwarzanie zmiksowanego sygnału:');
sound(x_change, 48000);
pause;