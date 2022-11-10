clc;
s = %s;
P1=(s+5)/(s*(s^2+3*s+2));
r=routh_t(P1,poly(0,'k'))
disp(r)


//testar K
K = 0;
[r,num]=routh_t(P1,K)
if num==0
   disp("System is stable")
else
   mprintf("There is %g sign changes in entries of first column.\nTherefore, system is unstable.", num)
end
