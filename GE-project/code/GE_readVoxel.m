% function: read raw voxel file

function [MaxData, MinData, Xlen, Ylen, Zlen] = GE_readVoxel(currentIndex, frows, sizeXa, directory_name, XFolderTemp)

AllsFolder = dir([directory_name,'\',XFolderTemp]);
[sA, sB] = size(AllsFolder);

dirMat = [directory_name,'\mat'];
if ~exist(dirMat,'dir')
    mkdir(dirMat);
end

% extract all X-folder name to list_stext
list_stext = '';
for i = 1:sA
    if AllsFolder(i).isdir
        folderName = AllsFolder(i).name;
        if folderName(1) == 'X'
            is_directory(i,1) = 1;
            list_stemp = AllsFolder(i).name;
            list_stext = strvcat(list_stext,list_stemp);
        end
    end
    kkk = 1;
end

[folder_num, kkk] = size(list_stext);

% read data in folder one by one
Raw_data = [];
MaxData = 0;
MinData = 0;

for i = 1:folder_num
    path_temp = [directory_name,'\',XFolderTemp,'\',list_stext(i,:),'\'];
    filename = dir([path_temp,'*.vxl']);
    [vxlRows,vxlCols] = size(filename);
    if vxlRows > 1
        warndlg('There are more than one voxel file in folder');
        return;
    end
    full_file_name = [path_temp, filename.name];
    fid = fopen(full_file_name, 'rb');
    Raw_data = fread(fid, 'int32'); 
    fclose(fid);
    
    Zlen = Raw_data(1,1);
    Xlen = Raw_data(2,1);
    Ylen = Raw_data(3,1);

    if Xlen ~= 64
        warndlg('The scanned data is not standard data (x <> 64)!');
        return;
    end
    % reshape the raw data; Reshape 4-D data to 3-D data
    alllen = Zlen*Xlen*Ylen;
    if alllen == length(Raw_data) - 5
        Data3Dtemp(:,:,1:Ylen) = reshape(Raw_data(4:end-2),Zlen,Xlen,Ylen);
    else
        Data3Dtemp(:,:,1:Ylen) = reshape(Raw_data(4:end),Zlen,Xlen,Ylen);
    end
    kkk = 1;
    
    % here only return the data from 9 to 56 of x dim;
    Data3D = Data3Dtemp(:,9:56,:);
    Data3D = shiftdim(Data3D,1);
    
    if i < 10
        YmatFileName = [dirMat,'\',XFolderTemp,'_000',num2str(i),'.mat'];
        YmatFileName_cal = [dirMat,'\cal_',XFolderTemp,'_000',num2str(i),'.mat'];
    else
        if i < 100
            YmatFileName = [dirMat,'\',XFolderTemp,'_00',num2str(i),'.mat'];
            YmatFileName_cal = [dirMat,'\cal_',XFolderTemp,'_00',num2str(i),'.mat'];
        else
            if i < 1000
                YmatFileName = [dirMat,'\',XFolderTemp,'_0',num2str(i),'.mat'];
                YmatFileName_cal = [dirMat,'\cal_',XFolderTemp,'_0',num2str(i),'.mat'];
            else
                YmatFileName = [dirMat,'\',XFolderTemp,'_',num2str(i),'.mat'];
                YmatFileName_cal = [dirMat,'\cal_',XFolderTemp,'_',num2str(i),'.mat'];
            end
        end
    end
    
    % save the un-calibrated data
    save(YmatFileName,'Data3D');
    
    % get the extrema for each 3D data;
    MaxDatatemp = max(Data3D(:));
    MinDatatemp = min(Data3D(:));
    if MaxDatatemp > MaxData
        MaxData = MaxDatatemp;
    end
    if MinDatatemp < MinData
        MinData = MinDatatemp;
    end
    
    % save the calibrated data;
    [cal_data,cal_data_surface] = GE_calibration(1, Data3D);
    save(YmatFileName_cal,'cal_data','cal_data_surface');
    
    % clear the 3D data
    clear cal_data;
    clear Data3D;
    
    if sizeXa ~= 0
        waitbar(((currentIndex - 1) * (sizeXa - 2) + i)/(frows * (sizeXa - 2)));
    end

    
    kkk = 1;
end

        
% MaxData = max(Raw_data(:));
% MinData = min(Raw_data(:));
% 
% setappdata(gcf,'MaxData',MaxData);
% setappdata(gcf,'MinData',MinData);


kkk = 1;