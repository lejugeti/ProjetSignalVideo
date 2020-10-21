clear all
clc

video = VideoReader('video.mp4');
frame1 = read(video, 1);
%frame2 = read(video, 201);

dimImg = size(frame1);
img = rgb2ycbcr(frame1);
luminance = img(:,:,1);
Cb = img(:,:,2);
Cr = img(:,:,2);

%imshow(frame1);

pointGaucheHaut1 = [685 411];
pointGaucheBas1 = [630 762];
pointDroiteHaut1 = [1339 238];
pointDroiteBas1 = [1428 580];

pointGaucheHaut2 = [685 411];
pointGaucheBas2 = [630 762];
pointDroiteHaut2 = [1339 238];
pointDroiteBas2 = [1428 580];

D1 = DetecteurHarris(luminance, 3);
D2 = DetecteurHarris(luminance, 5);
D = min(D1 .* abs(D2), D2 .* abs(D1));

%%
W = 37; %zone de pixels dans laquelle on va chercher les coins
X = 40;
Y = 40;
Xmin = X - (W-1)/2;
Xmax = X + (W-1)/2;
Ymin = Y - (W-1)/2;
Ymax = Y + (W-1)/2;

img = DecoupeImagette(luminance, [500,500]);
%% Seuillage du signal
test = SeuillageCoins(D);

simpleCol = [0, 0.5, 1]';
map = cat(2, simpleCol, simpleCol, simpleCol);
figure, imagesc(test, [0 1]), colormap(map);