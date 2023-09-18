[xt , Fs] = audioread("instru3.wav");

% Spectrogram parameters
window_length = 100; 
overlap = 10;        

% Create and plot the spectrogram
figure;
spectrogram(xt, hanning(window_length), overlap, [], Fs, 'yaxis');
title('Spectrogram of Instrument 3');
grid on;
hold on;

% Calculate FFT
N = length(xt); 
X = fft(xt);    
frequencies = (0:N-1) * Fs / N; 

% Plot the frequency spectrum
figure;
plot(frequencies, abs(X));
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('Frequency Spectrum of Instrument 3');
grid on;

% Find the peak frequency (fundamental frequency)
[~, index] = max(abs(X));
fundamental_frequency = frequencies(index);

% Display the fundamental frequency
fprintf('Fundamental Frequency: %.2f Hz\n', fundamental_frequency);