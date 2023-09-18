[xt , Fs] = audioread("Opera.wav");

% Spectrogram parameters
window_length = 100; 
overlap = 10;

% Create and plot the spectrogram
figure;
spectrogram(xt, hanning(window_length), overlap, [], Fs, 'yaxis');
title('Spectrogram of Opera');
grid on;
hold on;