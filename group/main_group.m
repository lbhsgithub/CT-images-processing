%% ����Լ����� int+dir �������
N = 4;
path = uigetdir('d:\','!!!choose date/recipe folder!!!');
D = dir(path);% how to determine the order of name in dir?
%% ��ȡtensile.xlsx�е�Ӧ���Ӧ������¼��peak.txt
path_=[path,'/','tensile_data.xlsx'];
peak = zeros(4,2);
for i = 1:N
    peak(i,:) = xlsread(path_,num2str(i),'G1:H1');
end
%% дtxt f_idΪ�ļ��������fopen()�����еõ�����ȱʡ�����������Ļ
f_id = fopen([path,'/peak.txt'],'wt');%�ڵ�ǰĿ¼��д�ķ�ʽ�򿪻򴴽�txt�ļ�
fprintf(f_id,'%d',peak);%��� ����������� ��ͳһ���Ƹ�ʽ
fclose(f_id);%�ر��ļ�
%% ����c_crit �������ȼ���k1 k2 k3 
K = first_crack_strength(0.33,1.3);
%% ���� sigma ����ccrit
c_crit = solve XXXXXX 
%% ��ȡÿ���Լ��е�pore data
for i = 1:N
    No = [path,'/',num2str(i),'/'];
    % ��һ�εúú��Ż�һ�£���ǰ���ظ���
    D = dir( [No,num2str(i),'c']);% how to determine the order of name in dir?
    num=numel(D)-2;
    pore_data_path = [No,'pore_data.xlsx'];
    [~,~,a]=xlsread(pore_data_path,'major_pore',['B1:B',num2str(num)]); %��ֵ����ȡ��������λ�����
    a=cell2mat(a);a(isnan(a))=0;a=Cize(a,2);MP=a;
    %�ϴ���������
    %b=xlsread(pore_data_path,'MPmaxSection','A:B');b(:,1)=Cize(b(:,1),2);MS=b;
    sum(MP>c_crit);
end
%% �ļ���Cize���ж��Ƿ����ccrit������������X���سߴ�X���ʣ����ż����й��ɿ��ó����ģ�=Ԥ��Ŀ�������ĳ��ȡ�/ɨ�����γ��ȣ����û�м�¼���뼫��Ӧ��
for 
%���⣬����������������ƺͻ��嵯��Ӧ�䣬�����ѷ�����Ի���ѷ�������
%plot



