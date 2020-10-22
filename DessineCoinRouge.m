function [ newImg, P1, P2 ] = DessineCoinRouge( img, coinAncien, coinActuel )
% d�termine les nouvelles coordonn�es du coint de la feuille � partir des
% deux coins pass�s en argument de la fonction

R = img(:,:,1);
G = img(:,:,2);
B = img(:,:,3);

newCoin = SuiviCoin(img, coinActuel, coinAncien); %vecteur (1,2)
x = newCoin(1);
y = newCoin(2);
G(y-5:y+5, x-5:x+5) = 0; %les coordonn�es de l'image sont (y,x) 
B(y-5:y+5, x-5:x+5) = 0;

newImg = cat(3, R,G,B);
P1 = coinActuel;
P2 = Point(x,y);
end

