%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%read two audio :
[x1,fs1]= audioread('D:\aya\ayas2\signal\audio1.wav');
[x2,fs]= audioread('D:\aya\ayas2\signal\audio2.wav');
%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%change audio 1 fs to be equal to fs for audio2 :
[p,q]=rat(2*fs/fs1)
x1=resample(x1,p,q)

[p,q]=rat(2*fs/fs)
x2=resample(x2,p,q)
sound(x1,2*fs)
sound(x2,2*fs)
%%%%%%%%%%%%%%%%%%%%

figure;plot(abs(fft(x1)));
for i=1:size(x1)
  x1(i)=x1(i)*cos(i*pi())
end
figure;plot(abs(fft(x1)));

for i=1:size(x1)
  x1(i)=x1(i)*cos(i*pi())
end
figure;plot(abs(fft(x1)));
sound(x1,2*fs)
%{
disp(length(x1))
t =[ 0:3*length(x1)];
y=zeros(3*size(x1))
for i=1:length(x1)
  y(i)=x1(i)
end
g3 = x1 .* cos( t * 2*pi/length(x1)*length(x1)/8);
clf;
subplot(2,2,1);
plot(x1); axis('tight');
title('Position 0, frequency 0');
subplot(2,2,2);
plot(x1); axis('tight');
title('Position 2*w, frequency 0');
subplot(2,2,3);

plot(g3); axis('tight');
title('Position 0, frequency w/8');
subplot(2,2,4);
plot(g3); axis('tight');
title('Position 2*w, frequency w/8');
% size of the window
w = 64*2;
% overlap of the window
q = w/2;

disp(t)
t1 = t-2*w;
f = w/8;
% Position 0, frequency 0.
g1 = sin( pi*t/w ).^2 .* double(t<w);

% Position 2*w, frequency 0.
g2 = sin( pi*t1/w ).^2 .* double( t1<w & t1>=0 );

% Position 0, frequency w/8
g1=x1;
g3 = g1 .* sin( t * 2*pi/w * f);
% Position 2*w, frequency w/8
g4 = g2 .* sin( t * 2*pi/w * f);
% display
clf;
subplot(2,2,1);
plot(g1); axis('tight');
title('Position 0, frequency 0');
subplot(2,2,2);
plot(g2); axis('tight');
title('Position 2*w, frequency 0');
subplot(2,2,3);

plot(g3); axis('tight');
title('Position 0, frequency w/8');
subplot(2,2,4);
plot(g4); axis('tight');
title('Position 2*w, frequency w/8');
%%%%%%%%%%%%%%%%%%%%%%%
%{
%%%%%%%%%%  A
N=length(x1);
y=zeros(size(x1)+size(x2))
A=0.01;
for i=1:size(x2)
  y(i)=x2(i) ;
end
for i=size(x2)+1:size(x2)+size(x1)
  y(i)=x1(i-size(x2))*A
end

figure;plot(y(25000:25200))
hold on ;plot(x2(25000:25200))
sound(y,fs2)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
}%