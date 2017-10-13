function y = randx(x,w,h)
xmin = x(1) - w/2;
xmax = x(1) + w/2;
ymin = x(2) - h/2;
ymax = x(2) + h/2;
y = [rand*(xmax-xmin)+xmin;rand*(ymax-ymin)+ymin];
