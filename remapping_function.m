%This is just a toy example!
function y=remapping_function(x,g0)
% sigma = 0.05;
numstep = 1024;
curve = linspace(-255,255,numstep);
curve_norm = curve./255;
step_norm = linspace(-255,255,numstep)./255;
curve_norm = (curve_norm<0).*0.1.*curve_norm+(curve_norm>0).*curve_norm;
% figure,plot(step_norm,curve_norm);
centerData = x-g0;
y_center  = interp1(step_norm,curve_norm,centerData);
y = y_center+g0;

end





