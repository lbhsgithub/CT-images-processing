function edgelist = shape_filter(edge) 
    %����
    L=cellfun(@numel,edge)/2;
    edge(L<8)=[]; 
    %�洢��ʼ��
    edgelist=[];
    %��б������б��Բ�뵽�������������pi*��x*��y��������
    for i=1:length(edge)
        %����Ҫ�õĲ���
        delta1=max(edge{i}(:,1))-min(edge{i}(:,1));
        delta2=max(edge{i}(:,2))-min(edge{i}(:,2));
        %delta=abs(delta1-delta2);
        kd=min(delta1,delta2)/max(delta1,delta2);
        S=polyarea(edge{i}(:,1),edge{i}(:,2));
        ks=S/(pi/4*delta1*delta2);%����ϵ��
        %����
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
%��������һֱ�仯���ȣ��Ͳ���ʶ�����������������һ�����һ����С���ڵ�һ���Ͳ���ʶ�����
%������������״��С�ı���͹�𣩿��ܻ������
%������plot(edge{i}(:,1),edge{i}(:,2))