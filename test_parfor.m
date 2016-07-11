% Test parfor
% http://blogs.mathworks.com/loren/2007/10/03/parfor-the-course/

% parfor cannot be nested!
% cannot use double indexed variables!

clear all;
clc;

n = 400;


%% ===================================================================== %%
ranksSingle = zeros(1,n);

tic;
for i = 1:n
    ranksSingle(i) = rank(magic(i));
end
toc;

plot(1:n,ranksSingle, 'b-o', 1:n, 1:n, 'm--');


%% ===================================================================== %%
matlabpool 2

ranksPar = zeros(3,n);
tic;
parfor i  = 1:n
    for a = 1:3
        ranksPar(2, i) = rank(magic(i));
    end
end
toc;

% % Double indexed variable not working
% ranksPar = zeros(3,n);
% tic;
% parfor i  = 1:n
%     for a = 1:3
%         ranksPar(a, i) = rank(magic(i));
%     end
% end
% toc;

matlabpool close

