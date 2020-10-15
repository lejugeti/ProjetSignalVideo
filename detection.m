clc

video = VideoReader('video.mp4');
frame1 = read(video, 1);
dimImg = size(frame1);
test = rgb2gray(frame1);

R = frame1(:,:,1);
G = frame1(:,:,2);
B = frame1(:,:,3);
%imshow(frame1);
 
pointGaucheHaut = [685 411];
pointGaucheBas = [630 762];
pointDroiteHaut = [1339 238];
pointDroiteBas = [1428 580];

n = 50;
bornes = 10;
[X,Y] = meshgrid(linspace(-bornes, bornes, n), linspace(-bornes, bornes, n));
sigmaGradient = 1;
sigmaCov = 0.05;
lambda = 0.05;

denominateurFiltreGaussien = 2 * pi * sigma^2;
denominateurDerivee = 2 * pi * sigma^4;
exposant = (X.^2 + Y.^2)/(2*sigma^2);

filtre_gaussien = (1 / denominateurFiltreGaussien) * exp(-exposant);
Gx = (-1 * X / denominateurDerivee) .* exp(-exposant);
Gy = (-1 * Y / denominateurDerivee) .* exp(-exposant);
%figure, subplot(1,2,1), surf(X,Y,Gx);
%subplot(1,2,2), surf(X,Y,Gy);

%Ix = ConvRGB(frame1, Gx);
%Iy = ConvRGB(frame1, Gy);
Ix = conv2(test, Gx, 'same');
Iy = conv2(test, Gy, 'same');

%Cxx = ConvRGB((Ix .* Ix),  filtre_gaussien);
%Cxy = ConvRGB((Ix .* Iy),  filtre_gaussien);
%Cyy = ConvRGB((Iy .* Iy),  filtre_gaussien);
Cxx = conv2((Ix .* Ix),  filtre_gaussien, 'same');
Cxy = conv2((Ix .* Iy),  filtre_gaussien, 'same');
Cyy = conv2((Iy .* Iy),  filtre_gaussien, 'same');

D = Cxx .* Cyy - Cxy .* Cxy - (lambda .* (Cxx + Cyy).^2);

%figure,imshow(frame1);
figure, imagesc(D), colormap('gray');