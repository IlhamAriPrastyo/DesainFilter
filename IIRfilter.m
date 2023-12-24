% Parameter filter
fs = 100000; % Frekuensi sampling
f_low = 10000; % Lower cutoff frequency
f_high = 20000; % Upper cutoff frequency

% Desain filter Butterworth menggunakan metode bilinear transform
n = 2; % Order filter
wn_low = 2 * pi * f_low ; % Cutoff 
wn_high = 2 * pi * f_high ; % Cutoff 

[b, a] = butter(n, [wn_low, wn_high], 's');

% Metode bilinear transform
[num, den] = bilinear(b, a, fs);

% Cetak koefisien
disp('Numerator Coefficients:');
disp(num);

disp('Denominator Coefficients:');
disp(den);
