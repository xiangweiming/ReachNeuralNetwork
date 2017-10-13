%hidenLayerOutput FUNCTION is to compute the output of the layer y = f(x)

function y = layerOutputPoint(input,layer) 

for i=1:1:layer.numNode
    y =  activeFun(input.weight*input.x + input.bias,layer.funType);    
end




 