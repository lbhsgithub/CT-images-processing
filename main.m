%!!!choose ./(date)/(recipe)/(specimen number)!!!
addpath(genpath(pwd))
%%% 
    %% file operation
    % global address;global Is_info
    file_operation;
    %% set all parameters in one function
    % global parameters
    parameters;
    %% (not start) brightness adjustment
%%% CT
    %% (unfinished) mark_bubbles
    mark_bubbles;
    %% print sideface of 3D image, used in processing backgroud image
    printsideface;
    %% repair and binarize image sequences
    binarize;
    %% excavate pore information hided in images
    get_poreinfo;
%%% photos
    %% process background picture£¨via photoshop£¬save as BP.png£©
        %subtract
        %fit size with sideface
    %% mark crack order  
    % need two matlab at the same time£¬troublesome
    find_crack;     %matlab1
    record_positon; %matlab2
%%%
    %% plot analysis frame£¬use pore_data and tensile_data
    plot_frame;
