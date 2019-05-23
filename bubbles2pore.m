function bubbles2pore()
    %bubblesID = 
    global address
    global Is_info
    inputdir = address.adjusted_dir;
    outputdir = address.bubbles2pore_dir;
    num = Is_info.size(3);
    V_bubbles = zeros(Is_info.size(1:3));
    for i = 1 : num
        p = imread([inputdir,Is_info.namelist{i},'.jpg']);
        if numel(size(p))==3
            p = rgb2gray(p);
        end
%         [N,edges] = histcounts(p);
%         N(1) = 0;
%         [~,Idx] = max(N);
%         threshold = (edges(Idx)+30)/255;
        threshold = 0.615;
        p = imbinarize(p,threshold);
        V_bubbles(:,:,i) = p;
    end
    V_bubbles_ = imfill(V_bubbles,'holes');
    CC = bwconncomp(V_bubbles_,6);
    for i = 1:CC.NumObjects
        if numel(CC.PixelIdxList{i}) < 4000   % d = 2mm 5800
            V_bubbles_(CC.PixelIdxList{i}) = 0;
        end
    end
    for i = 1 : num
        p = imread([inputdir,Is_info.namelist{i},'.jpg']);
        if numel(size(p)) == 3
            p = rgb2gray(p);
        end
        p_gray = p;
        CC = bwconncomp(V_bubbles_(:,:,i),4);
        for j = 1:CC.NumObjects
            p_gray(CC.PixelIdxList{j}) = 0;
        end
        savepath = [outputdir,Is_info.namelist{i},'.jpg'] ;
        imwrite(p_gray,savepath);
    end
end