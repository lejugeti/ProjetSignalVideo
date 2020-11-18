%% tests suivi de coins

clear all
clc
warning('off');

reader = VideoReader('video.mp4');
writer = VideoWriter('vid_detection_cubes');
writer.FrameRate = reader.FrameRate;
open(writer);

frame = read(reader, 1);
P1GH = Point(685, 411);
P2GH = Point(685,411);
P1GB = Point(630, 762);
P2GB = Point(630, 762);
P1DH = Point(1339, 238);
P2DH = Point(1339, 238);
P1DB = Point(1428, 580);
P2DB = Point(1428, 580);
P1Bleu = Point(729, 552);
P2Bleu = Point(729, 552);
P1Blanc = Point(922, 475);
P2Blanc = Point(922, 475);

h = waitbar(0, 'Traitement de la vidéo en cours'); %barre de chargement pour le traitement des la vidéo
i = 1;
while i < reader.NumberOfFrames + 1

    frame = read(reader, i); 

    [frame, P2GH, P1GH] = DessineCoinRouge(frame, P2GH, P1GH);
    [frame, P2GB, P1GB] = DessineCoinRouge(frame, P2GB, P1GB);
    [frame, P2DH, P1DH] = DessineCoinRouge(frame, P2DH, P1DH);
    [frame, P2DB, P1DB] = DessineCoinRouge(frame, P2DB, P1DB);
    [frame, P2Bleu, P1Bleu] = DessineCoinRouge(frame, P2Bleu, P1Bleu);
    [newFrame, P2Blanc, P1Blanc] = DessineCoinRouge(frame, P2Blanc, P1Blanc);
    
    
    writeVideo(writer, newFrame);
    
    waitbar(i/(reader.NumberOfFrames+1));
    i = i + 1;
    
end

close(h);
close(writer);