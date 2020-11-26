function [newFrame] = ReplaceFeuille(frame, img, PGH, PGB, PDH, PDB)
% Remplace la zone de la feuille dans la frame par l'image à incruster/
% newFrame est la frame modifiée à encoder dans la vidéo

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
posFeuille = boolean(SeuillageMain(frame, posFeuille, X1, Y1)); % position de la feuille sans la main

indexFrame = find(posFeuille); % index à changer dans la frame
indexImg = sub2ind([lengthY, lengthX], Y1(posFeuille), X1(posFeuille)); % index à prendre dans l'incruste

R1(indexFrame) = R2(indexImg);
V1(indexFrame) = V2(indexImg);
B1(indexFrame) = B2(indexImg);

newFrame = cat(3, R1, V1, B1);

end