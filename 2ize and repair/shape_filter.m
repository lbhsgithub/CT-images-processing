function edgelist = shape_filter(edge) 
    %初判
    L=cellfun(@numel,edge)/2;
    edge(L<8)=[]; 
    %存储初始化
    edgelist=[];
    %由斜条或者斜半圆想到，面积不饱满。pi*△x*△y与面积相比
    for i=1:length(edge)
        %计算要用的参数
        delta1=max(edge{i}(:,1))-min(edge{i}(:,1));
        delta2=max(edge{i}(:,2))-min(edge{i}(:,2));
        %delta=abs(delta1-delta2);
        kd=min(delta1,delta2)/max(delta1,delta2);
        S=polyarea(edge{i}(:,1),edge{i}(:,2));
        ks=S/(pi/4*delta1*delta2);%饱和系数
        %详判
        if S<10
            if kd>0.8&&ks>0.8
                edgelist=[edgelist;(edge{i})];
            end
        else
            if S<40
                if kd>0.25&&ks>0.40
                    edgelist=[edgelist;(edge{i})];
                end
            else
                if kd>0.15&&ks>0.40
                    edgelist=[edgelist;(edge{i})];
                end
            end
        end
    end
end
%如果孔面积一直变化均匀，就不会识别出来，或者两个孔一个变大一个变小，在第一步就不会识别出来
%极个别诡异的形状（小的表面凸起）可能会有误差
%测试用plot(edge{i}(:,1),edge{i}(:,2))