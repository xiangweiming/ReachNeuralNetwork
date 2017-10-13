clc
clear
%% load neural network
load data network
%network.weight{1} = net.IW{1};
%network.weight{2} = net.LW{2};
%network.bias{1} = net.b{1};
%network.bias{2} = net.b{2};
%network.activeType{1} = 1;
%network.activeType{2} =3;

%numNueron = [2,5,2];
%network.activeFun = {1,3};
%numLayer = length(numNueron)-1;

%for n = 1:1:numLayer
%    network.weight{n} = randn(numNueron(n+1),numNueron(n));
%    network.bias{n} = randn(numNueron(n+1),1);
%end


%load randomNN network  

%% Generate disceretized input sets 
%inputWidth = 1;
%inputHeight = 1;
%inputCenter = [0;0];
%inputRadius = 0.01;
inputWidth = 2*pi/6;
inputHeight = 2*pi/6;
inputCenter = [pi/2;pi/2];
inputRadius = 0.02;
iStart = inputCenter(1)-inputWidth/2;
iEnd =  inputCenter(1)+inputWidth/2;
jStart = inputCenter(2)-inputHeight/2;
jEnd =  inputCenter(2)+inputHeight/2;
step = 2*inputRadius;

k=0;
for i = iStart:step:iEnd-step
    for j= jStart:step:jEnd-step
       k=k+1;
       input{k}.min(1) = j;j;
       input{k}.min(2) = i;
       input{k}.max(1) = j+step;
       input{k}.max(2) = i+step;        
    end
end

%% Compute output set
tic
y = networkOutput(input,network);
toc
%% Draw picture for reachable set
%figure
for i = 1:1:length(y)
     squareplot(y{i},'b');
     hold on
end
%% Generate random output
tic
for i = 1:1:676
    inputPoint = randx(inputCenter,inputWidth,inputHeight); % center of input set
    yPoint = networkOutputPoint(inputPoint,network); % [y.y0,y.radius] = [center of output set, radius of output set]
    %plot(yPoint(1),yPoint(2),'.r')
    %hold on
end
toc




