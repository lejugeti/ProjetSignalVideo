function [newImg ] = ConvRGB(ImageRGB, Filtre)
%CONVRGB Summary of this function goes here
%   Detailed explanation goes here

dimImg = size(ImageRGB);
R = ImageRGB(:,:,1);
G = ImageRGB(:,:,2);
B = ImageRGB(:,:,3);

R = imresize(conv2(R, Filtre), [dimImg(1), dimImg(2)]);
G = imresize(conv2(G, Filtre), [dimImg(1), dimImg(2)]);
B = imresize(conv2(B, Filtre), [dimImg(1), dimImg(2)]);

newImg = cat(3, R, G, B);
end

