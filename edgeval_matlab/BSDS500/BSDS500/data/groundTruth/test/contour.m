clear
% make_gt_bondary_image.m
% bsdsRoot 需包含train、test 两个文件夹，生成的结果也放在这两个文件夹的bon子文件夹里
% 将此文件复制到需要转化的文件夹下
bsdsRoot = '/home/xuanyili/文档/code/刘云师兄/BSR/BSDS500/data/groundTruth/';
state = 'test';%修改为test或train，分别处理两个文件夹 
file_list = dir(fullfile(bsdsRoot,state,'*.mat'));%获取该文件夹中所有jpg格式的图像
for i=1:length(file_list)
    
    mat = load(file_list(i).name);
    [~,image_name,~] = fileparts(file_list(i).name);
    gt = mat.groundTruth;
    image = zeros(size(gt{1}.Boundaries));
    for gtid=1:length(gt)
        bmap = gt{gtid}.Boundaries;
        image = double(bmap) + image;

    end
    image = image / length(gt);
    
    %黑底白边
    %imwrite(double(image),fullfile(bsdsRoot,'bon',state,[image_name '.jpg']));
    %白底黑边
    imwrite(1-double(image),fullfile(bsdsRoot,'bon',state,[image_name '.jpg']));

end
