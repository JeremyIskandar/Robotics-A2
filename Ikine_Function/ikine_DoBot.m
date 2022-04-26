%%  DoBot Ikine function test

%Given an [x,y,z] position of joint 4, return q1,q2,q3
function [newQ] = ikine_DoBot(x, y, z)

    %Given theta, l, h  :   base rotation (about z), length from base link to EE link, height from base link to end link
    
    %LINK LENGTHS:
    a2 = 0.5;       %Distance from link 2 -> link 3
    a3 = 0.5;       %Distance from link 3 -> link 4        (from DH?)
    %theta_Do = pi;  %base angle (q1)                      (Need to calc?)
     
%     q1 = theta_Do

%   Calculations:

    l = sqrt(x^2 + y^2);    %Calc Perp Length from joint 1 to 4 using x and y
    D = sqrt(l^2 + z^2);    %Calc Dist from joint 1 to 4 using l and z

    t1 = atan(z/l);                                     %Calc t1 (Angle from l to D) using inv tan
    t2 = acos((a2^2 + D^2 - a3^2) / (2 * a2 * D));      %Calc t2 (Angle from D to joint 3) using Inv cos

    alpha = t1 + t2;                                        %Calc Alpha
    beta = acos((a2^2 + D^2 - a3^2) / (2 * a2 * D));        %Calc Beta
    

    q1 = atan(y/x);             % not sure yet, thinking of using atan(y/x)
    q2 = (pi / 2) - alpha;      %q2 solution
    q3 = pi - beta - alpha;     %q3 'real' solution

    newQ = [q1,q2,q3];
end