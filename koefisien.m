%Parameter
fs = 100000;
fc = 5000;
T = 1/fc;
omega_c = 2*pi*fs*T;
n = 1:11;

%hn
hn_0 = omega_c/pi;
hn_kanan = sin(0.2*pi*n)./(n*pi);
hn_kiri = fliplr(hn_kanan);

result = [hn_kiri, hn_0, hn_kanan];

% Hasil Akhir
disp(result);
