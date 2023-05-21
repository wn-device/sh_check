half_width= 128;
left_center = round(half_width/2);
right_center = half_width*2- left_center;
data = zeros(half_width,half_width*2);
left_val =  1;
right_val = 1;
data(:,1:half_width) =left_val;
data(:,half_width+1:end) = right_val;
y_vec = 1:4:254;
y_vec_norm = y_vec./255;
path = strcat("C:\Users\ange\Desktop\local_laplace\matlab_fast_llf_and_style_transfer\demo_method\","BinData",num2str(half_width),"/");
% for y_i = 1:length(y_vec)
%     left_val = y_vec(y_i);
%     data(:,1:half_width) =left_val;
%     data_65535 = data./255.*65535;
%     data_65535 = repmat(data_65535,[1,1,3]);
%     file_name = strcat(path,"inData/",num2str(left_val),"_",num2str(right_val),".tif");
%     imwrite(uint16(data_65535),file_name);
% end
lr_in_matrix = zeros(length(y_vec),2);
lr_out100matrix =  zeros(length(y_vec),2);
lr_out50matrix =  zeros(length(y_vec),2);
lr_basematrix = zeros(length(y_vec),2);
lr_in_normData = zeros(half_width,half_width*2);
sigma =1;
N = 16;
fact = 30;
for y_i =length(y_vec):-1:1
    y_index = y_vec(y_i);
      lr_inName = strcat(path,"lr_in","/",num2str(y_index),"_",num2str(right_val),".tif");
      lr_inData = bin_data_parse(half_width,lr_inName);
      lr_out100Name = strcat(path,"lr_out-100/",num2str(y_index),"_",num2str(right_val),".tif");
      lr_out100nData = bin_data_parse(half_width,lr_out100Name);
      lr_out50Name = strcat(path,"lr_out-50/",num2str(y_index),"_",num2str(right_val),".tif");
      lr_out50nData = bin_data_parse(half_width,lr_out50Name);
      lr_in_matrix(y_i,:) = lr_inData;
      lr_out100matrix(y_i,:) = lr_out100nData;
      lr_out50matrix(y_i,:) = lr_out50nData;
      
      lr_in_normData(:,1:half_width) =lr_inData(1);
      lr_in_normData(:,half_width+1:end) = lr_inData(2);
      lr_in_logData = normlin2normlog(lr_in_normData);
      matlab_logdata=llf_general(lr_in_logData,@remapping_function,N);
      matlab_data = normlog2normlin(matlab_logdata);
      lr_basematrix(y_i,1) = matlab_data(left_center,left_center);
      lr_basematrix(y_i,2) = matlab_data(left_center,right_center);
end
figure,hold on;
plot(y_vec_norm,lr_in_matrix(:,1));
plot(y_vec_norm,lr_out100matrix(:,1));
% plot(y_vec_norm,lr_out50matrix(:,1));
plot(y_vec_norm,lr_basematrix(:,1));


