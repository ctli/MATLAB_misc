% Test C = min(A,[],dim) on 3rd dimension

clear all;
clc;

C = [1 2 3;
     5 6 7];
[value,id] = min(C(:,:,:),[],2);
[value1,id1] = min(C); % equals to min(C(:,:,:),[],1);


B = zeros(2,3,4);
B(:,:,1) = [1 2 3;
            5 6 7];
B(:,:,2) = B(:,:,1) - 1;
B(:,:,3) = B(:,:,1) + 2;
B(:,:,4) = B(:,:,1) + 3;
[value,id] = min(B(:,:,:),[],3);

A = zeros(2,3,4,3);
A(:,:,:,1) = B;
A(:,:,:,2) = B+1;
A(:,:,:,3) = B+2;

[value,id] = min(A(:,:,:),[],3);

