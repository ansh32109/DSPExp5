% Define parameters
alpha = 3; 
Fs = 100;  
T = 10;    
t = 0:1/Fs:T-1/Fs; 

% Frequency sweep parameters
initial_freq = 2 + 2*alpha; 
final_freq = 5 + 5*alpha;   

% Generate chirp signal
Ft = initial_freq + (final_freq - initial_freq) * t / T; 
xt = sin(2 * pi * cumsum(Ft) / Fs); 

% Plot the chirp signal
plot(t, xt);
xlabel('Time (s)');
ylabel('Amplitude');
title('Chirp Signal');
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
title('Frequency Spectrum of Chirp Signal');
grid on;
hold on;

% Identify the frequency components
[max_amplitude, max_index] = max(abs(X));
dominant_frequency = frequencies(max_index);
fprintf('Dominant Frequency Component: %.2f Hz\n', dominant_frequency);

% Spectrogram parameters
window_length = 100; 
overlap = 10;        

% Create and plot the spectrogram
figure;
spectrogram(xt, hamming(window_length), overlap, [], Fs, 'yaxis');
title('Spectrogram of Chirp Signal (Using Hamming)');

% Spectrogram parameters
window_length = 100; 
overlap = 10;        

% Create and plot the spectrogram
figure;
spectrogram(xt, hanning(window_length), overlap, [], Fs, 'yaxis');
title('Spectrogram of Chirp Signal (Using Hanning)');
