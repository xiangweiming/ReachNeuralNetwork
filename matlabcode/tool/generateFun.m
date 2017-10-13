clc
clear
fileName = ['layerOutput' '.m'];
fid = fopen(fileName,'w');


load data network; 

%load randomNN network
layerNum = length(network.bias);

%layerInput.xmin;layerInput.xmax;
%network.weight;network.bias;network.activeType

fprintf(fid,'function y = layerOutput(layerNum,input,network)\n');
fprintf(fid,'switch layerNum\n');

for k = 1:1:layerNum
    fprintf(fid,'case %i\n',k);
    [n,m] = size(network.weight{k});
    for i = 1:1:n
        fprintf(fid,'ymax(%i) = activeFun(',i);
        for j = 1:1:m-1
            if network.weight{k}(i,j) > 0
                fprintf(fid,'network.weight{%i}(%i,%i)*input.max(%i)+',k,i,j,j);
            else
                fprintf(fid,'network.weight{%i}(%i,%i)*input.min(%i)+',k,i,j,j);
            end
        end
        if network.weight{k}(i,m) > 0
            fprintf(fid,'network.weight{%i}(%i,%i)*input.max(%i)+network.bias{%i}(%i),network.activeType{%i});\n',k,i,m,m,k,i,k);
        else
            fprintf(fid,'network.weight{%i}(%i,%i)*input.min(%i)+network.bias{%i}(%i),network.activeType{%i});\n',k,i,m,m,k,i,k);
        end
        fprintf(fid,'ymin(%i) = activeFun(',i);
        for j = 1:1:m-1
            if network.weight{k}(i,j) > 0
                fprintf(fid,'network.weight{%i}(%i,%i)*input.min(%i)+',k,i,j,j);
            else
                fprintf(fid,'network.weight{%i}(%i,%i)*input.max(%i)+',k,i,j,j);
            end
        end
        if network.weight{k}(i,m) > 0
            fprintf(fid,'network.weight{%i}(%i,%i)*input.min(%i)+network.bias{%i}(%i),network.activeType{%i});\n',k,i,m,m,k,i,k);
        else
            fprintf(fid,'network.weight{%i}(%i,%i)*input.max(%i)+network.bias{%i}(%i),network.activeType{%i});\n',k,i,m,m,k,i,k);
        end
    end
end
fprintf(fid,'end\n');
fprintf(fid,'y.min = ymin;\n');
fprintf(fid,'y.max = ymax;\n');


            







