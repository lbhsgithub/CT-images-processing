function plot_frame
    global address
    global Is_info
    global Parameters
    num=Is_info.size(3);x = 1:num;
    %�ϴ�׿�϶��С ������NaN���µ�����
    [~,~,a]=xlsread(address.dataxlsx,'major_pore',['B1:B',num2str(num)]); %��ֵ����ȡ��������λ�����
    a=cell2mat(a);a(isnan(a))=0;a=Cize(a,2);MP=a;
    %�ϴ���������
    b=xlsread(address.dataxlsx,'MPmaxSection','A:B');b(:,1)=Cize(b(:,1),2);MS=b;
    
    %��϶��
    K(:,1)=xlsread(address.dataxlsx,'all pore','A:A'); 
    K(:,2)=xlsread(address.dataxlsx,'major pore','A:A'); 
    
    %��۷���ͼ
    F=figure;title('��۷���');
    plot(x,K(:,1));  %������
    hold on;
    plot(x,K(:,2));  %������
    %�ֲ�����ͼ
    F=figure;title('�ֲ�����');
    plot(x,MP);  %������
    hold on;
    scatter(MS(:,2),MS(:,1),'.','r');  %ɢ��
    plot(x,Parameters.Ccrit,'.');%����ٽ�ߴ�
end

%[~,~,c] =xlsread([path,file],'order',['A2:A',num2str(length(a)+1)]);c=cell2mat(c);
%[~,~,d] =xlsread([path,file],'order',['B2:B',num2str(length(a)+1)]);d=cell2mat(d);
  %yyaxis left;
% %�ⲿ��֮�����ɾ��
% 
% yyaxis right;  %���������ָ��ֻ���Ҳ���Ч
% %�Ҳ�y����
% ylabel('����Ӧ��/Mpa','Color','b');
% ylim([0 ceil(max(c))]);
% scatter(x,c,'s','k');  %���ƿ���˳��
% %���Ʊ��
% text(x,c,num2str(c),'VerticalAlignment','bottom');
% text(x,c,num2str(d),'VerticalAlignment','top','HorizontalAlignment','right');
% 
% xlim([0 length(a)]);

%ʣ�µľ��ǵ�����ɫ

%list(list<0.2)=[]; %list��find������

