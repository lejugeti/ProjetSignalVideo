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

D1 = Detecteur(luminance, 3);
D2 = Detecteur(luminance, 5);
D = min(D1 .* abs(D2), D2 .* abs(D1));

%% Seuillage du signal
test = SeuillageCoins(D);

simpleCol = [0, 0.5, 1]';
map = cat(2, simpleCol, simpleCol, simpleCol);
figure, imagesc(test, [0 1]), colormap(map);