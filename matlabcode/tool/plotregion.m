clc
clear
figure;
load dataL5N10r001 y
for i = 1:1:length(y)
     squareplot(y{i},'b');
     hold on
end
xlabel('y_1');ylabel('y_2');

figure;
load dataL5N10r001 y
for i = 1:1:length(y)
     squareplot(y{i},'b');
     hold on
end
clear
clear;load dataL5N10r0005 y
for i = 1:1:length(y)
     squareplot(y{i},'c');
     hold on
end
xlabel('y_1');ylabel('y_2');

figure;
load dataL5N10r001 y
for i = 1:1:length(y)
     squareplot(y{i},'b');
     hold on
end
clear
clear;load dataL5N10r0005 y
for i = 1:1:length(y)
     squareplot(y{i},'c');
     hold on
end
clear;load dataL5N10r0002 y
for i = 1:1:length(y)
     squareplot(y{i},'m');
     hold on
end
xlabel('y_1');ylabel('y_2');

figure;
load dataL5N10r001 y
for i = 1:1:length(y)
     squareplot(y{i},'b');
     hold on
end
clear;load dataL5N10r0005 y
for i = 1:1:length(y)
     squareplot(y{i},'c');
     hold on
end
clear;load dataL5N10r0002 y
for i = 1:1:length(y)
     squareplot(y{i},'m');
     hold on
end
clear;load dataL5N10r0001 y
for i = 1:1:length(y)
     squareplot(y{i},'g');
     hold on
end
xlabel('y_1');ylabel('y_2');

figure;
load dataL5N10r001 y
for i = 1:1:length(y)
     squareplot(y{i},'b');
     hold on
end
clear
clear;load dataL5N10r0005 y
for i = 1:1:length(y)
     squareplot(y{i},'c');
     hold on
end
clear;load dataL5N10r0002 y
for i = 1:1:length(y)
     squareplot(y{i},'m');
     hold on
end
clear;load dataL5N10r0001 y
for i = 1:1:length(y)
     squareplot(y{i},'g');
     hold on
end

clear
load randomNN network 
inputWidth = 1;
inputHeight = 1;
inputCenter = [0;0];
inputRadius = 0.01;
iStart = inputCenter(1)-inputWidth/2;
iEnd =  inputCenter(1)+inputWidth/2;
jStart = inputCenter(2)-inputHeight/2;
jEnd =  inputCenter(2)+inputHeight/2;
step = 2*inputRadius;
for i = 1:1:5000
    inputPoint = randx(inputCenter,inputWidth,inputHeight); % center of input set
    yPoint = networkOutputPoint(inputPoint,network); % [y.y0,y.radius] = [center of output set, radius of output set]
    plot(yPoint(1),yPoint(2),'.r')
    hold on
end
xlabel('y_1');ylabel('y_2');