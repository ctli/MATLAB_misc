clear all
close all
clc

ex = [2 3 4   5;
      6 7 1.5 3;
      8 9 10 11]; % [3x4] matrix
  
[value,id] = min(ex(:))

dimention = size(ex);
[id_row,id_col] = ind2sub(dimention,id)