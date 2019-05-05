function file_operation
% function: obtain and record address and images information
% return: 3 global struct
% dir and path
% relative path

    %% read specimen number folder
    Nopath = uigetdir('d:\','!!!choose ./(date)/(recipe)/(specimen number)!!!');
    Nodir=[Nopath,'\'];                    %in 1
    oripath=[Nopath,'\',Nopath(end),'c'];  %1c
    oridir=[oripath,'\'];                  %in 1c
    D = dir(oripath);% how to determine the order of name in dir?
    num=numel(D)-2;%images amount
    % name sequences without extension
    namelist=cell(num,1);
    for i=3:numel(D)
        namelist{i-2,1}=D(i).name(1:end-4);
    end   
    %% create address struct (global)
    global address
    No=Nopath(end);
    processeddir = [oripath,'-processed\'];
    if ~exist(processeddir,'dir')
        mkdir(processeddir);
    end
    dataxlsx=[Nodir,'pore_data.xlsx'];
    tensile_dataxlsx=[Nopath(1:end-1),'tensile_data.xlsx'];
    for i=["Nodir" "oridir" "processeddir" ...
           "dataxlsx" "tensile_dataxlsx" ...
           "No"]
        eval(['address.',char(i),'=',char(i)])
    end
    %% create image basic informaion struct (global)
    p1path = [oridir,namelist{1},'.jpg'] ;
    s=size(imread(p1path));
    s=[s(1:2),num];
    Namelist{1}=namelist;  %or form grid with size in next step
    global Is_info
    Is_info = struct('namelist',Namelist,...
                     'size',s);
end

%excel initialize
%xlswrite(dataxlsx,["ratio" "size"],'all pore');

%%结构体不能直接用"："遍历,搜索"matlab 遍历结构体成员"(没找到)  D（字段的位置）.name(成员的位置)
% for i=3:numel(D)
%     Is_address_list{i-2,1}=[D(i).folder,'\',D(i).name];
% end