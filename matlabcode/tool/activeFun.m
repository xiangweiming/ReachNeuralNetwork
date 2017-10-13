function y = activeFun(x,activeType) 
switch activeType
    case 1
        y = tansig(x);
    case 2
        y = logsig(x);
    case 3
        y = purelin(x);
end