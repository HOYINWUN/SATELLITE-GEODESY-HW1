x=-7856125.132570323;
y=-3153615.476193391;
z=-8815677.901873229;
vx=2296.291456475990;
vy=3944.771956823101;
vz=-3449.641080085869;
hw=zeros(6,1+3600*24);
hw(:,1)=[x y z vx vy vz];
t=1;
h=1;
% j3=-2.54*10^-6;
% j4=-1.62*10^-6;
% j5=-0.23*10^-6;
% j6=0.54*10^-6;
for i=1:3600*24


%ax=-GM*x/r^3*(1-j2*1.5*(ae/r)^2*(5*(z/r)^2-1)+j3*2.5*(ae/r)^3*(3*z/r-7*(z/r)^3)-j4*5/8*(ae/r)^4*(3-42*(z/r)^2+63*(z/r)^4)-j5*3/8*(ae/r)^5*(35*z/r-210*(z/r)^3+231*(z/r)^5)+j6/16*(ae/r)^6*(35-945*(z/r)^2+3465*(z/r)^4-3003*(z/r)^6));
%ay=ax*y/x;
%az=-GM*z/r^3*(1+j2*1.5*(ae/r)^2*(3-5*(z/r)^2)+j3*1.5*(ae/r)^3*(10*z/r-35/3*(z/r)^3-r/z)-j4*5/8*(ae/r)^4*(15-70*(z/r)^2+63*(z/r)^4)-j5*1/8*(ae/r)^5*(315*z/r-945*(z/r)^3+693*(z/r)^5-15*r/z)+j6/16*(ae/r)^6*(315-2205*(z/r)^2+4851*(z/r)^4-3003*(z/r)^6));

 k1=f1(t,hw(:,i));
 k2=f1(t+h/2,hw(:,i)+h*k1/2);
 k3=f1(t+h/2,hw(:,i)+h*k2/2);
 k4=f1(t+h,hw(:,i)+h*k3);
 hw(:,i+1)=hw(:,i)+h/6*(k1+2*k2+2*k3+k4);
 if mod(i,3600)==0
     hw(:,i+1);
 end
end

%  k1=f1(t,hw(:,1));
%  k2=f1(t+h/2,hw(:,1)+h*k1/2);
%  k3=f1(t+h/2,hw(:,1)+h*k2/2);
%  k4=f1(t+h/2,hw(:,1)+h*k3);
%  hw(:,2)=hw(:,1)+1/6*(k1+2*k2+2*k3+k4);
%  k1=f1(t,hw(:,2));
%  k2=f1(t+h/2,hw(:,2)+h*k1/2);
%  k3=f1(t+h/2,hw(:,2)+h*k2/2);
%  k4=f1(t+h/2,hw(:,2)+h*k3);
%  hw(:,3)=hw(:,2)+1/6*(k1+2*k2+2*k3+k4);
