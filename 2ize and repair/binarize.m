function binarize()
    %% create folder
    global address
    address.binarydir = [address.processeddir,'binarized','\'];
    outputdir=address.binarydir;
    if ~exist(outputdir,'dir')
        mkdir(outputdir);
    end
    %% initialize
    global Is_info
    num=Is_info.size(3);
    V=cell(num,2);
    %% repair from head to tail
    for i = 1 : num
        %二值化
        p = imread([address.oridir,Is_info.namelist{i},'.jpg']);
        p = rgb2gray(p);p = imbinarize(p,graythresh(p));
        %存入大矩阵
        V{i,1}=~p;
        V{i,2}=~imfill(p,'hole');
        if i~=1
            V=repair(V,i,1);
        end
    end
    %% repair from tail to head 
    for i = num : -1 :1
        if i~=num
            V=repair(V,i,-1);
        end
        savepath = [outputdir,Is_info.namelist{i},'.bmp'] ;
        imwrite(V{i,1},savepath);
    end
end

% %% quick judge if need repair
% if i~=1
%     if abs(sum(sum(V{i,2}))-sum(sum(V{i-1,2})))>20
%         V=repair(V,i);
%     end
% end