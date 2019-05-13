function plot_frame
    global address
    global Is_info
    global Parameters
    num=Is_info.size(3);x = 1:num;
    %较大孔孔隙大小 避免有NaN导致的问题
    [~,~,a]=xlsread(address.dataxlsx,'major_pore',['B1:B',num2str(num)]); %空值不读取，导致了位置误差
    a=cell2mat(a);a(isnan(a))=0;a=Cize(a,2);MP=a;
    %较大孔最大截面积
    b=xlsread(address.dataxlsx,'MPmaxSection','A:B');b(:,1)=Cize(b(:,1),2);MS=b;
    
    %孔隙率
    K(:,1)=xlsread(address.dataxlsx,'all pore','A:A'); 
    K(:,2)=xlsread(address.dataxlsx,'major pore','A:A'); 
    
    %宏观分析图
    F=figure;title('宏观分析');
    plot(x,K(:,1));  %连续线
    hold on;
    plot(x,K(:,2));  %连续线
    %局部分析图
    F=figure;title('局部分析');
    plot(x,MP);  %连续线
    hold on;
    scatter(MS(:,2),MS(:,1),'.','r');  %散点
    plot(x,Parameters.Ccrit,'.');%绘出临界尺寸
end

%[~,~,c] =xlsread([path,file],'order',['A2:A',num2str(length(a)+1)]);c=cell2mat(c);
%[~,~,d] =xlsread([path,file],'order',['B2:B',num2str(length(a)+1)]);d=cell2mat(d);
  %yyaxis left;
% %这部分之后可能删掉
% 
% yyaxis right;  %后面的所有指令只对右侧有效
% %右侧y特征
% ylabel('开裂应力/Mpa','Color','b');
% ylim([0 ceil(max(c))]);
% scatter(x,c,'s','k');  %绘制开裂顺序
% %绘制标记
% text(x,c,num2str(c),'VerticalAlignment','bottom');
% text(x,c,num2str(d),'VerticalAlignment','top','HorizontalAlignment','right');
% 
% xlim([0 length(a)]);

%剩下的就是调调颜色

%list(list<0.2)=[]; %list和find的区别？

