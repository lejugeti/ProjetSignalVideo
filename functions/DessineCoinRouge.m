function [ newImg, P2, P1 ] = DessineCoinRouge( img, coinActuel, coinAncien )
% d�termine les nouvelles coordonn�es du coint de la feuille � partir des
% deux coins pass�s en argument de la fonction

R = img(:,:,1);
G = img(:,:,2);
B = img(:,:,3);

newCoin = SuiviCoin(img, coinActuel, coinAncien);
x = newCoin.X;
y = newCoin.Y;
G(y-3:y+3, x-3:x+3) = 0; %les coordonn�es de l'image sont (y,x) 
B(y-3:y+3, x-3:x+3) = 0;

newImg = cat(3, R,G,B);
P1 = coinActuel;
P2 = Point(x,y);
end

