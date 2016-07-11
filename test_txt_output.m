clc;

txt = [1 2
       2 4
       1 5
       1 6];

fid = fopen('matlab_file_output.txt','w');
fprintf(fid,'   r   c\n');
fprintf(fid,'%4d%4d\n', txt');%transpost the data!!!
fclose(fid);

clc;