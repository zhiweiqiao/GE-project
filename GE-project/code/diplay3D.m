function display3D(xr,yr,zr, zuobiao3D)
% xr = 48;
% yr = 208;
% zr = 135;

figure;
hold on;
[x,y,z] = getObject(xr,yr,zr);
h2 = surf (x,y,z); axis equal
set(h2, 'FaceAlpha',0.5);
set(h2, 'EdgeAlpha',0.5);
set(h2, 'EdgeAlpha',0.1);
set(h2, 'FaceColor',[0.1 0.1 0.1]);
grid


[x,y,z] = getElementObject();
% load Data3DDisplay.mat;
[rows,cols] = size(zuobiao3D);

tic;
for i = 1:rows
    xzb = zuobiao3D(i,1);
    yzb = zuobiao3D(i,2);
    zzb = zuobiao3D(i,3);
    
    h2 = surf (x + xzb,y + yzb,z + zzb); axis equal
    set(h2, 'FaceAlpha',0.5);
    set(h2, 'EdgeAlpha',0.5);
    set(h2, 'EdgeAlpha',0.1);
    set(h2, 'FaceColor',[0.1 0.1 0.1]);
end
toc;

axis([1 xr 1 yr 1 zr])
axis equal;
hold off;


kkk = 1;



function [x,y,z] = getElementObject()

x = [-0.5,-0.5,-0.5,-0.5,-0.5;...
      0.5, 0.5, 0.5, 0.5, 0.5;...
      0.5, 0.5, 0.5, 0.5, 0.5;...
     -0.5,-0.5,-0.5,-0.5,-0.5;...
     -0.5,-0.5,-0.5,-0.5,-0.5;];
y = [-0.5,-0.5,-0.5,-0.5,-0.5;
     -0.5,-0.5,-0.5,-0.5,-0.5;
      0.5, 0.5,-0.5,-0.5, 0.5;
      0.5, 0.5,-0.5,-0.5, 0.5;
     -0.5,-0.5,-0.5,-0.5,-0.5;];
z = [-0.5,-0.5,-0.5,-0.5,-0.5;
     -0.5,-0.5,-0.5,-0.5,-0.5;
     -0.5, 0.5, 0.5,-0.5,-0.5;
     -0.5, 0.5, 0.5,-0.5,-0.5;
     -0.5,-0.5,-0.5,-0.5,-0.5;];
 
function [x,y,z] = getObject(xr,yr,zr)

x = [0,	0,	0,	0,	0;
1,	1,	1,	1,	1;
1,	1,	1,	1,	1;
0,	0,	0,	0,	0;
0,	0,	0,	0,	0;];
		
y = [0,	0,	0,	0,	0;
     0,	0,	0,	0,	0;
     1,	1,	0,	0,	1;
     1,	1,	0,	0,	1;
     0,	0,	0,	0,	0;];
			
z = [0,	0,	0,	0,	0;
     0,	0,	0,	0,	0;
     0,	1,	1,	0,	0;
     0,	1,	1,	0,	0;
     0,	0,	0,	0,	0;];

 x = x * xr;
 y = y * yr;
 z = z * zr;
 