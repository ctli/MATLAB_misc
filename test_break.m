%% When it will breaking out from a for loop
%% Conclusion: only break out the most inner loop
clear all
clc;

for i =1:5
    for j = 1:4
        if i == 2
            disp('j loop break')
            break;
        end
    end
    for k = 1:3
        if i == 2
            disp(i)
        end
    end
    
end