function [posFeuille, X1, Y1] = PositionFeuille(frame, img, PGH, PGB, PDH, PDB)

% calcule la position de la feuille à partir de l'homographie, et renvoie

% les matrices contenant les points correspondant de l'incruste X1 et Y1

dimensionsImg = size(img);

lengthY = dimensionsImg(1);

lengthX = dimensionsImg(2);



R1 = frame(:,:,1); % couleurs de la frame

V1 = frame(:,:,2);

B1 = frame(:,:,3);


R2 = img(:,:,1); % couleurs de l'incruste

V2 = img(:,:,2);

B2 = img(:,:,3);



h = Homographie(PGH, PGB, PDH, PDB, lengthX, lengthY); % matrice d'homographie 3x3

h = inv(h);



[X, Y] = meshgrid(1:1920, 1:1080); %grilles des coordonnées de la frame

B = [X(:), Y(:), ones(size(X(:)))]; %permet le produit matriciel avec h pour chaque point

C = B * h'; %transformation pour trouver vers quel pixel de l'incruste pointent ceux de la frame


X1 = round(C(:,1)./C(:,3)); %coordonnées X transposées dans l'incruste

Y1 = round(C(:,2)./C(:,3)); %coordonnées Y transposées dans l'incruste



posFeuille = boolean((X1 > 0) .* (X1 <= lengthX) .* (Y1 > 0) .* (Y1 <= lengthY));



end