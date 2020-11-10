function [R, G, B] = DecompositionRGB(img)

%Décompose l'image en canaux RGB


R = img(:,:,1);

G = img(:,:,2);

B = img(:,:,3);


end