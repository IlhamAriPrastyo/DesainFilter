% Parameters
fs = 100000; % Sampling rate
fcl = 10000; 
fch = 20000;
tap = 3; % Filter order ini dimulai dari 0 sehingga 0 1 2 bisa dibilang hasilnya 5 tap filter
T = 1/fs;
% normalized
omega_l = 2*pi*fcl*T;
omega_h = 2*pi*fch*T;
n = 1:2; % karena 5 tap jadinya -2 -1 0 1 2
hn_0 = omega_h - omega_l/pi;
hn_kanan = (sin(omega_h*n)./(n*pi)) - (sin(omega_l*n)./(n*pi));
hn_kiri = fliplr(hn_kanan);

% Hamming window
hamming_window = hamming(tap);

% Apply Hamming window to filter coefficients
hn_kiri = hn_kiri .* hamming_window(1:end-1).';
hn_0 = hn_0 * hamming_window(tap);
hn_kanan = hn_kanan .* fliplr(hamming_window(1:end-1)).';

% hasil hamming window
koef = [hn_kiri, hn_0, hn_kanan];

disp(koef);
