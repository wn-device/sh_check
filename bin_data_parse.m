function re_data = bin_data_parse(half_width,filename)
 data = imread(filename);
left_center = round(half_width/2);
right_center = half_width*2- left_center;
left_data_65535 = data(left_center,left_center,1);
right_data_65535 = data(left_center,right_center,1);
re_data = zeros(1,2);
re_data(1) = double(left_data_65535)./65535;
re_data(2) =  double(right_data_65535)./65535;
end