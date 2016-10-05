% this is calibration function, 
% input: 
%   CBS_cal: calibration mode
%   Data3D: the data which is calibrated
% output:
%   cal_data: calibrated 3D data
%   topsurface_new: the calibration surface

function [cal_data topsurface] = GE_calibration(CBS_cal, Data3D)
% DataInformation = getappdata(gcf,'DataInformation');
[lenX, lenY, lenZ] = size(Data3D);

% CBS_cal = 10;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
topsurface = zeros(lenX,lenY);     %%%%%----this variable is used to store the calibrated distance matrix
switch CBS_cal
    case 1
        cal_data = zeros(lenX, lenY, lenZ);

        for i = 1:lenX
            for j = 1:lenY
                top = min(Data3D(i,j,:));
                topind = find(Data3D(i,j,:) == top);        
                if topind(1,1) < lenZ
                    topsurface(i,j) = topind(1,1);
                    len = 512 - topind(1,1) + 1;
                    cal_data(i,j,1:len) = Data3D(i,j,topind:end);
                end
            end
        end

        kkk = 1;
        
    case 2
        cal_data = zeros(lenX, lenY);

        for i = 1:lenY
            top = min(Data3D(:,i));
            topind = find(Data3D(:,i) == top);        
            if topind(1,1) < 256
                len = 512 - topind(1,1) + 1;
                cal_data(1:len,i) = Data3D(topind:end,i);
            end
        end

    case 3
        cal_data = zeros(lenY, lenX);

        for i = 1:lenY
            top = min(Data3D(:,i));
            topind = find(Data3D(:,i) == top);        
            if topind(1,1) < 256
                len = 512 - topind(1,1) + 1;
                cal_data(i,1:len) = Data3D(topind:end,i)';
            end
        end
    case 4
        cal_data = zeros(1, lenX);
        top = min(Data3D);
        topind = find(Data3D == top);        
        if topind(1,1) < 256
            len = 512 - topind(1,1) + 1;
            cal_data(1,1:len) = Data3D(topind:end,1)';
        end
        kkk = 1;
    case 10
        cal_data = zeros(lenX, lenY, lenZ);

        for i = 1:lenX
            for j = 1:lenY
                top = min(Data3D(i,j,:));
                topind = find(Data3D(i,j,:) == top);        
                if topind(1,1) < 256
                    topsurface(i,j) = topind(1,1);
%                     len = 512 - topind(1,1) + 1;
%                     cal_data(i,j,1:len) = Data3D(i,j,topind:end);
                end
            end
        end
        
        topsurface_original = topsurface;
        
        for i = 1:lenX
            data = topsurface(i,:)';
            x = (1:lenY)';
            p = polyfit(x,data,3);
            f = floor(polyval(p,x));
            topsurface(i,:) = ((abs(f) + f)/2)';
            kkk = 1;
        end
        
        for i = 1:lenX
            for j = 1:lenY
                if topsurface(i,j) ~= 0
                    len = 512 - topsurface(i,j) + 1;
                    cal_data(i,j,1:len) = Data3D(i,j,topsurface(i,j):end);
                end
            end
        end
        
        
        case 11
        cal_data = zeros(lenX, lenY, lenZ);

        for i = 1:lenX
            for j = 1:lenY
                top = min(Data3D(i,j,:));
                topind = find(Data3D(i,j,:) == top);        
                if topind(1,1) < 256
                    topsurface(i,j) = topind(1,1);
%                     len = 512 - topind(1,1) + 1;
%                     cal_data(i,j,1:len) = Data3D(i,j,topind:end);
                end
            end
        end
        
        topsurface_original = topsurface;
        
        rows = lenX;
        cols = lenY;

        y = [1:rows]';
        x = [1:cols];
        ww = ones(size(topsurface));

%         P_weighted=polyfitweighted2(x,y,topsurface,4,topsurface);
        P_weighted=polyfitweighted2(x,y,topsurface,8,ww);
        z = polyval2(P_weighted,x,y);
        topsurface_new = z;

        kkk = 1;

        
        for i = 1:lenX
            data = topsurface(i,:)';
            x = (1:lenY)';
            p = polyfit(x,data,3);
            f = floor(polyval(p,x));
            topsurface(i,:) = ((abs(f) + f)/2)';
            kkk = 1;
        end
        
        for i = 1:lenX
            for j = 1:lenY
                if topsurface(i,j) ~= 0
                    len = 512 - topsurface(i,j) + 1;
                    cal_data(i,j,1:len) = Data3D(i,j,topsurface(i,j):end);
                end
            end
        end
        
end

kkk = 1;
