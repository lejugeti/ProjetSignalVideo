function [ coinNouveau, coinActuel] = SuiviCoin(frame, coinActuel, coinAncien )
% Renvoie les coordonn�es du nouveau coin apr�s avoir �t� trait� par un
% d�tecteur de Harris. 
% On passe en argument l'image � traiter ainsi que les couples [X Y] des coins actuel et ancien

frame = rgb2ycbcr(frame);
lum = frame(:,:,1);
ajoutFenetre = 40; %pixels � ajouter pour d�couper l'imagette
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
D2 = D(Ymin:Ymax, Xmin:Xmax); % on r�duit la fen�tre de recherche

centreD2 = (W-1)/2 + 1;
c = [centreD2, centreD2]; %coordonn�es du centre de l'imagette r�duite
maxLum = max(max(D2));
[yCoin, xCoin] = find(D2==maxLum); % on trouve les coordonn�es du maximum de luminance dans l'imagette

diffCentre = [yCoin, xCoin] - c;

coinNouveau = Point(coinActuel.X + diffCentre(2), coinActuel.Y + diffCentre(1));

end

