function [porosity,porelist] = eliminateAIR_saveI(p,S,address,name)
    CC = bwconncomp(p,4);
    numPixels = cellfun(@numel, CC.PixelIdxList); 
    % For the current CT images, air is the max area CC. 
    % if not, should mark air as before
    [numPixels_sorted,I] = sort(numPixels,'descend');
    % mark air
    Sair = numPixels_sorted(1);
    air_ids = CC.PixelIdxList{I(1)};
    % eliminate air
    porelist = numPixels_sorted(2:end);
    porosity = (sum(porelist))/(S-Sair);
    p(air_ids)=0;
    %´æ´¢
    imwrite(p,[address,name,'.bmp']);
end

