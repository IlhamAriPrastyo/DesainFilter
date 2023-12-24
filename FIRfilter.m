load('sinyal_diskrit4.mat');  
fc = 5000;
fs = 100000;
nT = 0:1/fs:(length(xn)-1)/fs;

b = [0.0170, -0.0000, -0.0208, -0.0378, -0.0432, -0.0312, 0.0000, 0.0468, 0.1009, 0.1514, 0.1871, 40.0000, 0.1871, 0.1514, 0.1009, 0.0468, 0.0000, -0.0312, -0.0432, -0.0378, -0.0208, -0.0000, 0.0170];
a = 1;
w = xn;
w2 = w + 0.5 * randn(1, length(w));

% frekuensi
yf = filter(b, a, w);

% perbandingan original dan yang difilter
figure(1);
plot(nT, w2);
xlabel('detik');
ylabel('amplitudo');
title('Sinyal Asli + Derau');
grid on

% plotting
N = length(w2);
x = abs(fft(w2));
x2 = abs(fft(yf));
xf = fs * (0:(N - 1)) / N;

figure(2);
stem(xf, x);
xlabel('frekuensi');
ylabel('amplitudo');
title('Spektrum Sinyal + Derau');
grid on

figure(3);
stem(xf, x2);
xlabel('frekuensi');
ylabel('amplitudo');
title('Spektrum Sinyal Terfilter (23-tap)');
grid on

[h,w] = freqz(b,a,n);

% Plot magnitude response
figure;
plot(w, abs(h));
title('Frequency Response');
xlabel('Frequency (rad/sample)');
ylabel('Magnitude');
grid on;