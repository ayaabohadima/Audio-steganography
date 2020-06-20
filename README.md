# Audio-steganography
##Steganography refers to the practice of hiding a message within another message. In this task,
you are given two audio files (audio1 and audio2) and you are required to hide audio1 in the
audio2 file, such that a normal listener will not notice any change in audio2. Then, we will be
able to extract audio1 separately.
a) Read two audio files (audio1.wav and audio2.wav)
b) Hide audio1 in audio2 as follows

c) Plot the magnitude spectrum of using plot(abs(fft(X))). You may need to use
log10(abs(fft(X))) to see very small values.
d) Now, it is required to restore  audio1
