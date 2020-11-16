function [ coinNouveau, coinActuel] = SuiviCoin(frame, coinActuel, coinAncien )
% Renvoie les coordonnées du nouveau coin après avoir été traité par un
% détecteur de Harris. 
% On passe en argument l'image à traiter ainsi que les couples [X Y] des coins actuel et ancien

frame = rgb2ycbcr(frame);
lum = frame(:,:,1);
ajoutFenetre = 40; %pixels à ajouter pour découper l'imagette
W = 37;

estimation = EstimationNouveauCoin(coinActuel, coinAncien);
imagette = DecoupeImagette(lum, estimation, ajoutFenetre);
D = DetecteurRobuste(imagette);

[lengthX, lengthY] = size(D);
centreImagette = (lengthX - 1)/2 + 1; % valeur du centre de l'imagette
Xmin = centreImagette - (W - 1)/2;
Xmax = centreImagette + (W - 1)/2;
Ymin = centreImagette - (W - 1)/2;
Ymax = centreImagette + (W - 1)/2;
D2 = D(Ymin:Ymax, Xmin:Xmax); % on réduit la fenêtre de recherche

centreD2 = (W-1)/2 + 1;
c = [centreD2, centreD2]; %coordonnées du centre de l'imagette réduite
maxLum = max(max(D2));
[yCoin, xCoin] = find(D2==maxLum); % on trouve les coordonnées du maximum de luminance dans l'imagette

diffCentre = [yCoin, xCoin] - c;

coinNouveau = Point(coinActuel.X + diffCentre(2), coinActuel.Y + diffCentre(1));

end

