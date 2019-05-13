function [kp,numPixels_sorted] = cut_record(p,S_,address,name)
    CC = bwconncomp(p,4);
    numPixels = cellfun(@numel, CC.PixelIdxList); 
    %��¼��϶�ʵ�kp
    kp=(sum(numPixels))/S_;
    %��¼��϶��С�ֲ�
    [numPixels_sorted,~] = sort(numPixels,'descend');
    %�洢
    imwrite(p,[address,name,'.bmp']);
end

