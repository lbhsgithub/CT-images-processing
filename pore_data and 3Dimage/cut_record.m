function [kp,numPixels_sorted] = cut_record(p,S_,address,name)
    CC = bwconncomp(p,4);
    numPixels = cellfun(@numel, CC.PixelIdxList); 
    %记录孔隙率到kp
    kp=(sum(numPixels))/S_;
    %记录孔隙大小分布
    [numPixels_sorted,~] = sort(numPixels,'descend');
    %存储
    imwrite(p,[address,name,'.bmp']);
end

