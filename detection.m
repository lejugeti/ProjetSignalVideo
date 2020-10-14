clc

video = VideoReader('video.mp4');
frame1 = read(video, 1);
%imshow(frame1);
 
pointGaucheHaut = [685 411];
pointGaucheBas = [630 762];
pointDroiteHaut = [1339 238];
pointDroiteBas = [1428 580];

[X,Y] = meshgrid(-100:100, -100:100);
SigmaX = 2;
SigmaY = 2;
Gx = (-X / (2 * pi * SigmaY * SigmaX^3)) * exp(-1 * ((X*X)/(2*SigmaX^2)) + ((Y*Y)/(2*SigmaY^2)));
Gy = (-Y / (2 * pi * SigmaY * SigmaX^3)) * exp(-1 * ((X*X)/(2*SigmaX^2)) + ((Y*Y)/(2*SigmaY^2)));
