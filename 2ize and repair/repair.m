function V = repair(V,i,pm)
%������ ֻ��ʶ��һ��ʼ���ǿ����׵�
    global Is_info   %ͼƬ��Ϣ�ṹ��
    display(i);
    p=V{i,2}-V{i-pm,2};
    edge=bwboundaries(p);
    edgelist=shape_filter(edge);
     %ע��������Ƕ�ά���꣨������������ֱ���á������sub2indתΪ��������
    if ~isempty(edgelist)
        linearInd = sub2ind(Is_info.size(1:2), edgelist(:,1), edgelist(:,2));
        %��������
        V{i,1}(linearInd)=0;
        V{i,2}=~imfill(~V{i,1},'hole');
    end
end

%(����%F2 = imdilate(F1,ones(3));BW3 = bwperim(F2);?)  
%��Ҫrepair�Ĳ�ֻ���ҵ����꣬�޸����ͼ����Ӧ��Sair��airlist��Ҫ�����޸�