%% remplacement d'image fonctionnel

clear all
clc
warning('off');

img = imread('clown.jpg');
reader = VideoReader('video.mp4');
writer = VideoWriter('new_vid_test_y');
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

    frame = read(reader, i); 

    [P2GH, P1GH] = SuiviCoin(frame, P2GH, P1GH);
    [P2GB, P1GB] = SuiviCoin(frame, P2GB, P1GB);
    [P2DH, P1DH] = SuiviCoin(frame, P2DH, P1DH);
    [P2DB, P1DB] = SuiviCoin(frame, P2DB, P1DB);
    
    newFrame = ReplaceFeuille(frame, img, P2GH, P2GB, P2DH, P2DB);
    writeVideo(writer, newFrame);
    
    waitbar(i/(reader.NumberOfFrames+1));
    i = i + 1;
    
end

close(h);
close(writer);

