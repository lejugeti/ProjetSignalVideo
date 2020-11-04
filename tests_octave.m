clear all
clc
warning('off');

reader = VideoReader('video.mp4');
writer = VideoWriter('new_vid_octave');
//writer.FrameRate = reader.FrameRate;
open(writer);

P1GH = Point(685, 411);
P2GH = Point(685,411);
P1GB = Point(630, 762);
P2GB = Point(630, 762);
P1DH = Point(1339, 238);
P2DH = Point(1339, 238);
P1DB = Point(1428, 580);
P2DB = Point(1428, 580);

h = waitbar(0, 'Traitement de la vidéo en cours'); //barre de chargement pour le traitement des la vidéo
i = 1;
while i < reader.NumberOfFrames + 1
    img = read(reader, i); 
    
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
