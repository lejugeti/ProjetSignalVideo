function [ newImg, P2, P1 ] = DessineCoinRouge( img, coinActuel, coinAncien )
% détermine les nouvelles coordonnées du coint de la feuille à partir des
% deux coins passés en argument de la fonction

R = img(:,:,1);
G = img(:,:,2);
B = img(:,:,3);

newCoin = SuiviCoin(img, coinActuel, coinAncien);
x = newCoin.X;
y = newCoin.Y;
G(y-3:y+3, x-3:x+3) = 0; %les coordonnées de l'image sont (y,x) 
B(y-3:y+3, x-3:x+3) = 0;

newImg = cat(3, R,G,B);
P1 = coinActuel;
P2 = Point(x,y);
end

