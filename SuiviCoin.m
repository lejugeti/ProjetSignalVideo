function [ nouveauCoin ] = SuiviCoin(img, coinActuel, coinAncien )
% Renvoie les coordonn�es du nouveau coin apr�s avoir �t� trait� par un
% d�tecteur de Harris. 
% On passe en argument l'image � traiter ainsi que les couples [X Y] des coins actuel et ancien

img = rgb2ycbcr(img);
lum = img(:,:,1);

estimation = EstimationNouveauCoin(coinActuel, coinAncien);
imagette = DecoupeImagette(lum, estimation);

end

