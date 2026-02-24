
        fun = @(x) x*x*((lamta0+x)^2+u*u)-CT^2/4; % function
        x0 = 0.5*CT/sqrt(u*u+CT/2);% initial interval
        [mu1,fval] = fzero(fun,x0);