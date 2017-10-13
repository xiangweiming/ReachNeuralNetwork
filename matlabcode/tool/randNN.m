clc
clear

numNueron = [2,10,10,10,10,10,2];
network.activeType = {1,1,1,1,1,3};
numLayer = length(numNueron)-1;

for n = 1:1:numLayer
    network.weight{n} = randn(numNueron(n+1),numNueron(n));
    network.bias{n} = randn(numNueron(n+1),1);
end

save randomNN network