function [V,Sair]=voxel(Va)
    global Parameters
    CC = bwconncomp(Va,6); %bwconncomp is very effective..
    numVoxels = cellfun(@numel,CC.PixelIdxList); 
    [Voxelslist,I]=sort(numVoxels,'descend');
    k=find(Voxelslist<Parameters.min_volume,1,'first'); %find the start of smaller pore
    %% slice and sum
    S=cell(1,k-1);
    max_section=zeros(k-1,2);                      %max_section is matrix of max area(row 1) and its position number(row 2) for major air volume (contains pores)
    for i=1:k-1
        S{i}=slice_sum(CC.PixelIdxList{I(i)});     %S is list of area and its position number for each air volume cut in slices 
        [max_section(i,1),maxID]=max(S{i}(:,1));   %get max area. attention!!function max count number individually
        max_section(i,2)=S{i}(maxID,2);            %get position number of max area
    end
    %% Initialize 
    %V=cell(1,2);
    %% all pore （fill air）
    Va(CC.PixelIdxList{I(1)})=0;
    V{1}=Va;
    %% major pore (more, fill small pore)
    V{2}=Va;
    for i=1:CC.NumObjects
        if numVoxels(i)<Parameters.min_volume
        V{2}(CC.PixelIdxList{i}) = 0;
        end
    end
    %% eliminate air and save
    global output
    output.max_section=max_section(2:end,:);
    output.Voxelslist=Voxelslist(2:end);
    %% return for next step
    Sair=S{1}(:,1);     %Sair for each image
end

%{
3D描边？描边主要是为了检查错误 或者输出空气三维坐标：CC.PixelIdxList{I(1)}用于二维描边
%填小孔报错：超出了程序允许的最大变量值。
%temp=CC.PixelIdxList{I(k:end)};
%V(temp)=0;
%}
    