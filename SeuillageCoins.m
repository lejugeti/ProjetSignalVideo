function [ signalSortie ] = SeuillageCoins( signal )
%SEUILLAGECOINS Summary of this function goes here
%   Detailed explanation goes here

seuilCoin = 1 * 10^7;
seuilBord = -1 * 10^7;

condCoin = signal > seuilCoin;
condBord = signal < seuilBord;
condRemplissage = (signal < seuilCoin) & (signal > seuilBord); 

signal(condCoin) = 0;
signal(condBord) = 1;
signal(condRemplissage) = 0.5;

signalSortie = signal;
end

