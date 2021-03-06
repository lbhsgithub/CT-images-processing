function file_operation
% function: record address and images information
% relative path
% path no \ at tail
% dir only for folder, have \ in the end

    %% read specimen number folder
    No_path = uigetdir('!!!choose ./(date)/(recipe)/(specimen number)!!!');
    [date,No,~] = fileparts(No_path);
    No_dir = [No_path,'\'];                     %in 1
    raw_images_path = [No_path,'\',No_path(end),'c'];  %1c
    raw_images_dir = [raw_images_path,'\'];     %in 1c
    D = dir(raw_images_path);                  % how to determine the order of name in dir?
    images_amount = numel(D)-2;
    % name sequences without extension
    namelist=cell(images_amount,1);
    for i=3:numel(D)
        namelist{i-2,1}=D(i).name(1:end-4);
    end   
    %% create address struct (global)
    global address
    processed_dir = [raw_images_path,'-processed\'];
    if ~exist(processed_dir,'dir')
        mkdir(processed_dir);
    end
    binarized_dir = [processed_dir,'binarized\'];
    major_pore_dir = [processed_dir,'major_pore\'];
    all_pore_dir = [processed_dir,'all_pore\'];
    adjusted_dir = [processed_dir,'adjusted\'];
    bubbles2pore_dir = [processed_dir,'bubbles2pore\'];
    dataxlsx = [No_dir,'pore_data.xlsx'];
    tensile_dataxlsx = [date,'\tensile_data.xlsx'];
    for i=["No_path" "No_dir"  "raw_images_path" "raw_images_dir" "processed_dir" "binarized_dir" "major_pore_dir" "all_pore_dir" "adjusted_dir" "bubbles2pore_dir"...
           "dataxlsx" "tensile_dataxlsx" ...
           "No"]
        eval(['address.',char(i),'=',char(i)])
    end
    make_folders(address);
    %% create image basic informaion struct (global)
    p1path = [raw_images_dir,namelist{1},'.jpg'];
    s=size(imread(p1path));
    s=[s(1:2),images_amount];
    Namelist{1}=namelist;  %if not, will form grid with size in next step
    global Is_info
    Is_info = struct('namelist',Namelist,...
                     'size',s);
end

function make_folders(struct)
%用address中的'dir'来标记要创建的文件夹
    for folder_name = string(fieldnames(struct))'   % must be row vector
        if contains(folder_name,'dir')
            folder_path = (eval(['struct.',char(folder_name)]));
            if ~exist(folder_path,'dir')
                mkdir(folder_path);
            end
        end
    end
end