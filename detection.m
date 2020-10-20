clc

video = VideoReader('video.mp4');
frame1 = read(video, 1);

dimImg = size(frame1);
%test = rgb2gray(frame1);
img = rgb2ycbcr(frame1);
luminance = img(:,:,1);
Cb = img(:,:,2);
Cr = img(:,:,2);

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

lambda = 0.05;

G = FiltreG(X, Y, 3);
Gx = FiltreDeriveeG(X, Y, 'X');
Gy = FiltreDeriveeG(X, Y, 'Y');
%figure, subplot(1,2,1), surf(X,Y,Gx);
%subplot(1,2,2), surf(X,Y,Gy);

Ix = conv2(luminance, Gx, 'same');
Iy = conv2(luminance, Gy, 'same');

%Cxx = ConvRGB((Ix .* Ix),  filtre_gaussien);
%Cxy = ConvRGB((Ix .* Iy),  filtre_gaussien);
%Cyy = ConvRGB((Iy .* Iy),  filtre_gaussien);
Cxx = conv2((Ix .* Ix),  G, 'same');
Cxy = conv2((Ix .* Iy),  G, 'same');
Cyy = conv2((Iy .* Iy),  G, 'same');

D = Cxx .* Cyy - Cxy .* Cxy - (lambda .* (Cxx + Cyy).^2);
newImg = cat(3, D, Cb, Cr); 
%figure,imshow(frame1);
figure, imagesc(D), colormap('gray');