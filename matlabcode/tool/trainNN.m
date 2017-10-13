clc
clear
l1 = 10; % length of first arm
l2 = 7; % length of second arm

d=0.05;
e=pi/12;
theta1 = pi/2-e:d:pi/2+e; % all possible theta1 values
theta2 = pi/2-e:d:pi/2+e; % all possible theta2 values

[THETA1,THETA2] = meshgrid(theta1,theta2); % generate a grid of theta1 and theta2 values

X = l1 * cos(THETA1) + l2 * cos(THETA1 + THETA2); % compute x coordinates
Y = l1 * sin(THETA1) + l2 * sin(THETA1 + THETA2); % compute y coordinates

data1 = [X(:) Y(:) THETA1(:)]; % create x-y-theta1 dataset
data2 = [X(:) Y(:) THETA2(:)]; % create x-y-theta2 dataset

%load data input output

[nX,mX] = size(X);
outputX= reshape(X,1,nX*mX);
[nY,mY] = size(Y);
outputY= reshape(Y,1,nY*mY);
output=[outputX;outputY];

[nTHETA1,mTHETA1] = size(THETA1);
inputTHETA1= reshape(THETA1,1,nTHETA1*mTHETA1);
[nTHETA2,mTHETA2] = size(THETA2);
inputTHETA2= reshape(THETA2,1,nTHETA2*mTHETA2);
input=[inputTHETA1;inputTHETA2];




%找出训练数据和预测数据
%inputn=input(n(1:1900),:)';
%outputn=output(n(1:1900));
%input_test=input(n(1901:2000),:)';
%output_test=output(n(1901:2000));

%选连样本输入输出数据归一化
%[inputn,inputps]=mapminmax(input_train);
%[outputn,outputps]=mapminmax(output_train);

%% BP网络训练
% %初始化网络结构
%net=newff(input,output,5,{'tansig','purelin'});
net=newff(minmax(input),[5,2],{'tansig','purelin'}','trainlm');
%net=newff(minmax(input),[5 5 2],{'poslin','poslin','purelin'}','trainlm');

net.trainParam.epochs=10000;
net.trainParam.lr=0.01;
net.trainParam.goal=0.00001;

%网络训练
net=train(net,input,output)

network.weight{1} = net.IW{1};
for i =2:1:length(net.b)
    network.weight{i} = net.LW{i,i-1};
end

for i =1:1:length(net.b)
    network.bias{i} = net.b{i};
end

network.activeType = {1  3};

save data network



d=0.05;
e=pi/6;
theta1 = pi/2-e:d:pi/2+e; % all possible theta1 values
theta2 = pi/2-e:d:pi/2+e; % all possible theta2 values
[THETA1,THETA2] = meshgrid(theta1,theta2); 

[nTHETA1,mTHETA1] = size(THETA1);
inputTHETA1= reshape(THETA1,1,nTHETA1*mTHETA1);
[nTHETA2,mTHETA2] = size(THETA2);
inputTHETA2= reshape(THETA2,1,nTHETA2*mTHETA2);
input=[inputTHETA1;inputTHETA2];

an=sim(net,input)

plot(an(1,:),an(2,:),'.')

%save data net

X = l1 * cos(THETA1) + l2 * cos(THETA1 + THETA2); % compute x coordinates
Y = l1 * sin(THETA1) + l2 * sin(THETA1 + THETA2); % compute y coordinates
figure
plot(X(:),Y(:),'r.');
  axis equal;
  xlabel('X','fontsize',10)
  ylabel('Y','fontsize',10)
 title('X-Y coordinates generated for all theta1 and theta2 combinations using forward kinematics formula','fontsize',10)
