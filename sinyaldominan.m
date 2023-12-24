% parameter
load('sinyal_diskrit4')
fs = 100000;
N = length(n);
X = abs(fft(xn));
X_mag = abs(X) / N; 
% frekuensi dan threshold
frequencies = (0:N-1) * fs / N;
threshold = 0.6 * max(X_mag);
dominant_indices = find(X_mag > threshold);
time = (0:N-1) / fs;

% Plot time-domain signal
figure;
plot(time, xn);
title('Time Domain Signal');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;
print('Time_Domain_Signal','-dpng');

figure;
stem(frequencies, X_mag, 'b'); 
hold on;
stem(frequencies(dominant_indices), X_mag(dominant_indices), 'r'); % Red stems for dominant frequencies
title('Frequency Spectrum of the Signal');
xlabel('Frequency (Hz)');
ylabel('Magnitude');grid on;
print('Frequency_Spectrum','-dpng');

% Display dominant frequencies and magnitudes as a list
disp('Dominant Frequencies and Magnitudes:');
for i = 1:length(dominant_indices)
    fprintf('Frequency: %.2f Hz, Magnitude: %.2f\n', frequencies(dominant_indices(i)), X_mag(dominant_indices(i)));
end
