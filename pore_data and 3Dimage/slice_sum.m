function S = slice_sum(IDlist)
%SUM_SILDE ������ά����ͨ���򣩵�һά�������飬������ĳ��������Ƭ��ÿ����Ƭ�����
%   input һά����������                                                       ���Ժ�������ӣ���Ƭ�����ȡֵ��Χ����ֱ��Ƭ���������ȣ�
%   output 2*n�����飬һ������Ƭ�����һ�������

    global Is_info
    Sxy=Is_info.size(1)*Is_info.size(2);
    %����
    V=false(Is_info.size(1:3));
    V(IDlist)=true;
    %ȷ��Z��ķ�Χ
    head = ceil(IDlist(1)/Sxy);
    tail = ceil(IDlist(end)/Sxy);
    %�����洢����
    S=zeros(tail-head+1,2);
    S(:,2)=head:tail;
    %
    for i = head:tail      %����ÿ��Z����ƽ��
        S(i-head+1,1) = sum(sum(V(:,:,i)));
    end
end

%�������;��
%1�ҵ���Ƭ�����ֵ�Լ���Ӧ����ţ���Ϊ��ͼ��Ҫ�Ľ��
%2����������������Ƭ��϶�ʵ�ʱ����
