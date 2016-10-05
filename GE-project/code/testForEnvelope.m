f = 10;
dt = 0.01; % sec
t = 0:dt:1; % time axis vector
x = cos(2*pi*f*t);

tau = 0.2; % sec
y = exp(-t/tau) .* sin(2*pi*f*t);
figure, plot(t,y);hold on

ind=find(diff(sign(diff(y)))==+2)+1;
val=interp1(t(ind),y(ind),t,'linear');
plot(t,val,'r') 
