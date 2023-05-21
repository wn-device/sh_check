x = linspace(0,1,500);
% x = x.*255;
% c = 255./log2(1+255);
% y = c.*log2(1+x);
% x1 = 2.^(y./c)-1;
% x2 = 2.^(x./c)-1;
% figure,plot(x./255,y./255);
% hold on,plot(x./255,x1./255);
% hold on,plot(x./255,x./255);
% hold on,plot(x./255,x2./255);
y = normlin2normlog(x);
figure,plot(x,y);
hold on,
x0 = normlog2normlin(y);
x1 = normlog2normlin(x);
hold on,plot(x,x0);
hold on,plot(x,x1);