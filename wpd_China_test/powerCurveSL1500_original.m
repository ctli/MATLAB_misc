function p=powerCurveSL1500(pd)
p=0;
if (pd < 16.54) p=0;
else if (pd>723.56) p=1;
    else 
    p=((-2.437e-06)*pd^3+0.001558*pd^2+2.255*pd-24.14)/1500;
    end
end
if (pd>4900) p=0; end



