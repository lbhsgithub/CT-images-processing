%!!!choose ./(date)/(recipe)/(specimen number)!!!
addpath(genpath(pwd))
%%% basic info
    %% file operation
    file_operation;
    %% set all parameters in one function
    % global parameters
    parameters;
    %% brightness adjustment
    brightness_adjustment;
%%% CT
    %% (unstart) crack in CT image
    % crack;
    %% emptying_bubbles,replaced by hollow
    bubbles2pore;
    %% print sideface of 3D image, used in processing background image
    % printsideface;
    %% repair and binarize images
    binarize;
    %% get pore information in images
    get_pore_info;
% %%% photos
%     %% process background picture£¨via photoshop£¬save as BP.png£©
%         %subtract
%         %fit size with sideface
%     %% mark crack order  
%     % need two matlab at the same time£¬troublesome
%     find_crack;     %matlab1
%     record_positon; %matlab2
%%% evaluate
    %% plot analysis frame£¬use pore_data and tensile_data
    % plot_frame;
    
     
