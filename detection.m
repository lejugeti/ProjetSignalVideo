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

pointGaucheHaut1 = [685 411];
pointGaucheBas1 = [630 762];
pointDroiteHaut1 = [1339 238];
pointDroiteBas1 = [1428 580];

pointGaucheHaut2 = [685 411];
pointGaucheBas2 = [630 762];
pointDroiteHaut2 = [1339 238];
pointDroiteBas2 = [1428 580];

% D1 = DetecteurHarris(luminance, 3);
% D2 = DetecteurHarris(luminance, 5);
% D = min(D1 .* abs(D2), D2 .* abs(D1));
D = DetecteurRobuste(luminance);
%% tests détection de coin
clc

W = 37;
ajoutFenetre = 100;

R = frame1(:,:,1);
G = frame1(:,:,2);
B = frame1(:,:,3);

P1 = Point(685, 411);
P2 = Point(685,411);

newCoin = SuiviCoin(frame1, P1, P2);
x = newCoin(1);
y = newCoin(2);
G(y-5:y+5, x-5:x+5) = 0;
B(y-5:y+5, x-5:x+5) = 0;
newImg = cat(3, R,G,B);
imshow(newImg);

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
writer = VideoWriter('new_vid_fenetre100_gradientTaille10.mp4');
writer.FrameRate = reader.FrameRate;
open(writer);

P1 = Point(685, 411);
P2 = Point(685,411);

h = waitbar(0, 'Attendez svppppp');
i = 1;
while i < reader.NumberOfFrames + 1
    img = read(reader, i); 
    R = img(:,:,1);
    G = img(:,:,2);
    B = img(:,:,3);
    
    newCoin = SuiviCoin(img, P2, P1);
    x = newCoin(1);
    y = newCoin(2);
    G(y-5:y+5, x-5:x+5) = 0;
    B(y-5:y+5, x-5:x+5) = 0;
    newImg = cat(3, R,G,B);
    
    P1 = P2;
    P2 = Point(x, y);
    
    writeVideo(writer, newImg);
    
    waitbar(i/(reader.NumberOfFrames+1));
%     sprintf('progression : %f %',(i/reader.NumberOfFrames)*100);
    i = i + 1;
    
end

close(h);
close(writer);
