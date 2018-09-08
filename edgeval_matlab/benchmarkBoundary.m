function benchmarkBoundary(edges_dir, gt_dir, name)
% Porting from Pdollar's edges.
addpath('mex');
addpath('utils');
if nargin < 1
  edges_dir = 'data/tiny-edges';
  gt_dir = 'data/tiny-gts';
  name = 'Tiny-Edge';
elseif nargin == 1
  gt_dir = 'data/tiny-gts';
  [~, name, ~] = fileparts(edges_dir);
elseif nargin == 2
  [~, name, ~] = fileparts(edges_dir);
end
assert(exist(edges_dir, 'dir')==7); assert(exist(gt_dir, 'dir')==7);
param = struct();
param.gtDir = gt_dir;
param.cleanup = 0;
param.thrs = 99;
%% do nms and save to .png
nms_dir = [edges_dir, '-nms'];
if ~exist(nms_dir, 'dir')
   mkdir(nms_dir); 
end
imgs = dir(fullfile(edges_dir, '*.png')); imgs = {imgs.name};
for i = 1:length(imgs)
  if exist(fullfile(nms_dir, imgs{i}), 'file')
      continue; 
  end
  E = imread(fullfile(edges_dir, imgs{i})); E = single(E);
  E = E ./ max(E(:));
  [Ox,Oy] = gradient2(convTri(E,4));
  [Oxx,~] = gradient2(Ox); [Oxy,Oyy]=gradient2(Oy);
  O = mod(atan(Oyy.*sign(-Oxy)./(Oxx+1e-5)),pi);
  E = edgesNmsMex(E,O,1,5,1.01,4);
  imwrite(E, fullfile(nms_dir, imgs{i}));
end
param.resDir = nms_dir;
%% perform evaluation
[ODS,~,~,~,OIS,~,~,AP,R50] = edgesEvalDir( param );
edgesEvalPlot(nms_dir, name);
end % end function
