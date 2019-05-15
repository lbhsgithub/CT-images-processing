function V_majorpore_withair = voxel(V_allpore_withair)
    global Parameters
    CC = bwconncomp(V_allpore_withair,6); %bwconncomp is very effective..
    numVoxels = cellfun(@numel,CC.PixelIdxList); 
    [Voxelslist,I]=sort(numVoxels,'descend');
    k = find(Voxelslist<Parameters.min_volume,1,'first');  %find the start of smaller pore
    %% slice and sum to find max_section of each major pore
    % initialize
    major_CCs = cell(1,k-1);
    max_section=zeros(k-1,2);                              %max_section is matrix of max area(row 1) and its position number(row 2) for major air volume (contains pores)
    for i=1:k-1
        major_CCs{i}=slice_sum(CC.PixelIdxList{I(i)});     %S is list of area and its position number for each air volume cut in slices 
        [max_section(i,1),maxID]=max(major_CCs{i}(:,1));   %get max area. attention!!function max count number individually
        max_section(i,2)=major_CCs{i}(maxID,2);            %get position number of max area
    end
   %% eliminate air and save
    global pore_data
    pore_data.MPmaxSection = max_section(2:end,:);
    pore_data.distribution_3D = Voxelslist(2:end);
    %% major pore (fill small pore)
    V_majorpore_withair = V_allpore_withair;
    for i = 1:CC.NumObjects
        if numVoxels(i)<Parameters.min_volume
             V_majorpore_withair(CC.PixelIdxList{i}) = 0;
        end
    end
end

%{
3D��ߣ������Ҫ��Ϊ�˼����� �������������ά���꣺CC.PixelIdxList{I(1)}���ڶ�ά���
%��С�ױ��������˳��������������ֵ��V(CC.PixelIdxList{I(k:end)})=0;
20190514�����ơ�����ά�����ʱ���޲��Ĳ��ֿ�����������Ƭ����Ȼ�������ͨ��������
%}
    