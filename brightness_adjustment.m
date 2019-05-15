function brightness_adjustment
    % initialize
    global address
    global Is_info
    num = Is_info.size(3);
    peak_id = zeros(1,num);
    peak_id_adjusted = zeros(1,num); % for test
    outputdir = address.adjusted_dir;
    % average
    for i = 1 : num
        p = imread([address.raw_images_dir,Is_info.namelist{i},'.jpg']);
        p = rgb2gray(p);
        [N,~] = histcounts(p,0:256);
        [~,peak_id(i)] = max(N(4:256)); % there are also many black pixels, ignore 
    end
    average = floor(mean(peak_id));
    % brightness_adjustment
    for i = 1 : num
        p = imread([address.raw_images_dir,Is_info.namelist{i},'.jpg']);
        p = rgb2gray(p);
        %imadjust的问题在于把out范围之外的也拉到了out边缘，不然就完美了
        I1 = imadjust(p,[peak_id(i)/255,1],[average/255,1],1);I1(p<peak_id(i))=0;
        I2 = imadjust(p,[0,(peak_id(i)-1)/255],[0,(average-1)/255],1);I2(p>=peak_id(i))=0;
        I = I1+I2;
       % save
        savepath = [outputdir,Is_info.namelist{i},'.jpg'] ;
        imwrite(I,savepath);
       %% test
%{
        I3=I,I4=I-p;
        for n = 1:4
            eval(['subplot(1,4,',num2str(n),');imshow(I',num2str(n),')']);
        end
%}
        [N,~] = histcounts(I,0:256);
        [~,peak_id_adjusted(i)] = max(N(4:256));
    end
    %% test
    if any(peak_id_adjusted == peak_id_adjusted(1))  %any : and
        disp('全部相等');
    else
        disp('不是全部相等');
    end

end  



