function [posFeuille] = SeuillageMain(frame, posFeuille, X1, Y1)

% Seuillage de la main. On passe en argument une frame et la position de la
% feuille dans la frame. X1 et Y1 sont les matrices indiquant les

% coordonn�es de l'incruste � int�grer dans la feuille, ce qui est utile

% pour d�limiter la zone de la main



dimImg = size(frame);

dimY = dimImg(1);

dimX = dimImg(2);
N = dimY * dimX;


[R, V, B] = DecompositionRGB(frame);

R = R(posFeuille);

V = V(posFeuille);

B = B(posFeuille);



% d�coupage de la feuille pour prendre un rectangle approximatif o� il y a la main
% On fait �a car on ne veut pas seuiller les cubes 
posMain = boolean((X1 > 1400) .* (X1 <= 1920) .* (Y1 > 0) .* (Y1 <= 1080));

%calcul du mod�le colorim�trique


mu = uint8([sum(sum(R)), sum(sum(V)), sum(sum(B))] / N);

temp = double([R(:), V(:), B(:)] - mu);

sigma = (temp' * temp) / N; % matrice de covariance des couleurs de la feuille



%on applique le mod�le sur tous les pixels de la frame
[R, V, B] = DecompositionRGB(frame);

couleurs = double([R(:), V(:), B(:)] - mu); 
v = couleurs / sigma;

v = v .* couleurs; % �quivalent au produit matriciel pour un pixel seul
D = (sum(v'))'; % on somme les calculs RGB pour obtenir un crit�re par pixel


seuil = D < 20;



% reconstruction de la position de la feuille par seuillage de la main
% on fait une addition car le seuillage du mod�le colorim�trique efface les cubes
posFeuille = posFeuille .* ~posMain + posMain .* seuil;

posFeuille = reshape(posFeuille, 1080, 1920);


end