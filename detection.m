clear all
clc

video = VideoReader('video.mp4');
frame1 = read(video, 1);

dimImg = size(frame1);
img = rgb2ycbcr(frame1);
luminance = img(:,:,1);
Cb = img(:,:,2);
Cr = img(:,:,2);

%imshow(frame1);

pointGaucheHaut1 = [685, 411];
pointGaucheBas1 = [630, 762];
pointDroiteHaut1 = [1339, 238];
pointDroiteBas1 = [1428, 580];

pointGaucheHaut2 = [685, 411];
pointGaucheBas2 = [630, 762];
pointDroiteHaut2 = [1339, 238];
pointDroiteBas2 = [1428, 580];

% D1 = DetecteurHarris(luminance, 3);
% D2 = DetecteurHarris(luminance, 5);
% D = min(D1 .* abs(D2), D2 .* abs(D1));
D = DetecteurRobuste(luminance);

%% Seuillage du signal
test = SeuillageCoins(D);

simpleCol = [0, 0.5, 1]';
map = cat(2, simpleCol, simpleCol, simpleCol);
figure, imagesc(test, [0 1]), colormap(map);

%% test détection des coins

clear all
clc
warning('off');

reader = VideoReader('video.mp4');
writer = VideoWriter('new_vid_fenetre100_gradientTaille20');
writer.FrameRate = reader.FrameRate;
open(writer);

P1GH = Point(685, 411);
P2GH = Point(685,411);
P1GB = Point(630, 762);
P2GB = Point(630, 762);
P1DH = Point(1339, 238);
P2DH = Point(1339, 238);
P1DB = Point(1428, 580);
P2DB = Point(1428, 580);

h = waitbar(0, 'Traitement de la vidéo en cours'); %barre de chargement pour le traitement des la vidéo
i = 1;
while i < reader.NumberOfFrames + 1
    img = read(reader, i); 
%     R = img(:,:,1);
%     G = img(:,:,2);
%     B = img(:,:,3);
%     
%     newCoinGH = SuiviCoin(img, P2GH, P1GH); %vecteur (1,2)
%     x = newCoinGH(1);
%     y = newCoinGH(2);
%     G(y-5:y+5, x-5:x+5) = 0; %les coordonnées de l'image sont (y,x) 
%     B(y-5:y+5, x-5:x+5) = 0;
%     newImg = cat(3, R,G,B);
%     
%     
%     P1GH = P2GH;
%     P2GH = Point(x, y);
    
    [newImg, P1GH, P2GH] = DessineCoinRouge(img, P1GH, P2GH);
    [newImg, P1GB, P2GB] = DessineCoinRouge(newImg, P1GB, P2GB);
    [newImg, P1DH, P2DH] = DessineCoinRouge(newImg, P1DH, P2DH);
    [newImg, P1DB, P2DB] = DessineCoinRouge(newImg, P1DB, P2DB);
    writeVideo(writer, newImg);
    
    waitbar(i/(reader.NumberOfFrames+1));
    i = i + 1;
    
end

close(h);
close(writer);

%% test seuillage main

clear all
clc
warning('off');

P1GH = Point(685, 411);
P1GB = Point(630, 762);
P1DH = Point(1339, 238);
P1DB = Point(1428, 580);

img = imread('clown.jpg');
reader = VideoReader('video.mp4');
frame = read(reader,100);

[posFeuille, X1, Y1] = PositionFeuille(frame, img, P1GH, P1GB, P1DH, P1DB);
D = SeuillageMain(frame, posFeuille, X1, Y1);
D = reshape(D, 1080, 1920);
% D = D / 10^3;
imagesc(D);
