function [F] = solveState(x)

global sigma varpi alpha beta delta;

    F(1) = x(1)^sigma * x(2)^varpi - x(3);
    F(2) = beta*(1 - delta + x(4)) - 1;
    F(3) = x(5) - delta*x(6);
    F(4) = x(6) - alpha*(x(7)/(x(4)));
    F(5) = x(2) -(1-alpha)*(x(7)/(x(3)));
    F(6) = x(7) - x(6)^alpha * x(2)^(1-alpha);
    F(7) = x(7) - x(1) - x(5);
    
end