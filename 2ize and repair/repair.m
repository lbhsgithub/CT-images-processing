function V = repair(V,i,pm)
%局限性 只能识别一开始不是空气孔的
    global Is_info   %图片信息结构体
    display(i);
    p=V{i,2}-V{i-pm,2};
    edge=bwboundaries(p);
    edgelist=shape_filter(edge);
     %注意出来的是二维坐标（索引），不能直接用。解决：sub2ind转为线性索引
    if ~isempty(edgelist)
        linearInd = sub2ind(Is_info.size(1:2), edgelist(:,1), edgelist(:,2));
        %更新数据
        V{i,1}(linearInd)=0;
        V{i,2}=~imfill(~V{i,1},'hole');
    end
end

%(膨胀%F2 = imdilate(F1,ones(3));BW3 = bwperim(F2);?)  
%需要repair的不只是找到坐标，修改输出图，相应的Sair，airlist都要重新修改