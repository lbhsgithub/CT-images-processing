function mark_bubbles()
    %bubblesID = 
    global address
    global Is_info
    outputdir = [address.processeddir,'bubbles','\'];
    if ~exist(outputdir,'dir')
        mkdir(outputdir);
    end
    num=Is_info.size(3);
    for i = 1 : num
        p = imread([address.oridir,Is_info.namelist{i},'.jpg']);
        p = rgb2gray(p);
        [N,edges] = histcounts(p);
        N(1) = 0;
        [~,Idx] = max(N);
        threshold=(edges(Idx)+30)/255;
        Pro = imbinarize(p,threshold);
        %imshowpair(p,Pro,'montage');
        savepath = [outputdir,Is_info.namelist{i},'.bmp'] ;
        imwrite(Pro,savepath);
    end
end