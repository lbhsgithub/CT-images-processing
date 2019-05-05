function S = slice_sum(IDlist)
%SUM_SILDE 传入三维（连通区域）的一维坐标数组，计算沿某个方向切片后每个切片的面积
%   input 一维坐标向量。                                                       （以后可以增加，切片方向和取值范围，垂直切片方向的面积等）
%   output 2*n的数组，一排是切片面积，一排是序号

    global Is_info
    Sxy=Is_info.size(1)*Is_info.size(2);
    %充填
    V=false(Is_info.size(1:3));
    V(IDlist)=true;
    %确定Z向的范围
    head = ceil(IDlist(1)/Sxy);
    tail = ceil(IDlist(end)/Sxy);
    %创建存储数组
    S=zeros(tail-head+1,2);
    S(:,2)=head:tail;
    %
    for i = head:tail      %对于每个Z坐标平面
        S(i-head+1,1) = sum(sum(V(:,:,i)));
    end
end

%输出的用途：
%1找到切片内最大值以及对应的序号，即为作图需要的结果
%2保存空气面积，算切片孔隙率的时候用
