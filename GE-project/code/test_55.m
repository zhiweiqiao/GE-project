% princomp

clear;
clc;

load test_55.mat;
% data = [];
% for i = 1:48
%     i
%     for j = 1:256
%         temp =  test(i,j,:);
%         kkk = shiftdim(temp,1);
% 
%         data = [data;kkk];
% 
%     end
% end

kkk = cov(data);



kkk = 1;