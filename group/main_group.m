%% 获得试件数量 int+dir 先手输吧
N = 4;
path = uigetdir('d:\','!!!choose date/recipe folder!!!');
D = dir(path);% how to determine the order of name in dir?
%% 读取tensile.xlsx中的应变和应力并记录到peak.txt
path_=[path,'/','tensile_data.xlsx'];
peak = zeros(4,2);
for i = 1:N
    peak(i,:) = xlsread(path_,num2str(i),'G1:H1');
end
%% 写txt f_id为文件句柄，从fopen()函数中得到，若缺省，则输出到屏幕
f_id = fopen([path,'/peak.txt'],'wt');%在当前目录以写的方式打开或创建txt文件
fprintf(f_id,'%d',peak);%输出 可以整行输出 并统一控制格式
fclose(f_id);%关闭文件
%% 计算c_crit 参数，先计算k1 k2 k3 
K = first_crack_strength(0.33,1.3);
%% 加入 sigma 反算ccrit
c_crit = solve XXXXXX 
%% 读取每个试件中的pore data
for i = 1:N
    No = [path,'/',num2str(i),'/'];
    % 这一段得好好优化一下，和前面重复了
    D = dir( [No,num2str(i),'c']);% how to determine the order of name in dir?
    num=numel(D)-2;
    pore_data_path = [No,'pore_data.xlsx'];
    [~,~,a]=xlsread(pore_data_path,'major_pore',['B1:B',num2str(num)]); %空值不读取，导致了位置误差
    a=cell2mat(a);a(isnan(a))=0;a=Cize(a,2);MP=a;
    %较大孔最大截面积
    %b=xlsread(pore_data_path,'MPmaxSection','A:B');b(:,1)=Cize(b(:,1),2);MS=b;
    sum(MP>c_crit);
end
%% 文件，Cize并判断是否大于ccrit，计数，数量X像素尺寸X概率（不着急，有规律看得出来的）=预测的开裂区域的长度。/扫描区段长度（这个没有记录）与极限应变
for 
%额外，开裂区域里包含裂纹和基体弹性应变，除以裂缝间距可以获得裂缝数量。
%plot



