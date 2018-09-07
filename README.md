### HED-pytorch: Holistically-Nested Edge Detection
created by XuanyiLi, if you have any problem in using it, please contact:xuanyili.edu@gmail.com.

![prediction example](https://github.com/charlesq34/pointnet2/blob/master/doc/teaser.jpg)

### Citation
If you find our work useful in your research, please consider citing:

        @InProceedings{xie15hed,
    author = {"Xie, Saining and Tu, Zhuowen"},
    Title = {Holistically-Nested Edge Detection},
    Booktitle = "Proceedings of IEEE International Conference on Computer Vision",
    Year  = {2015},
        }

### Introduction
This work is based on our NIPS'17 paper. You can find arXiv version of the paper <a href="https://arxiv.org/pdf/1706.02413.pdf">here</a> or check <a href="http://stanford.edu/~rqi/pointnet2">project webpage</a> for a quick overview. PointNet++ is a follow-up project that builds on and extends <a href="https://github.com/charlesq34/pointnet">PointNet</a>. It is version 2.0 of the PointNet architecture.

PointNet (the v1 model) either transforms features of *individual points* independently or process global features of the *entire point set*. However, in many cases there are well defined distance metrics such as Euclidean distance for 3D point clouds collected by 3D sensors or geodesic distance for manifolds like isometric shape surfaces. In PointNet++ we want to respect *spatial localities* of those point sets. PointNet++ learns hierarchical features with increasing scales of contexts, just like that in convolutional neural networks. Besides, we also observe one challenge that is not present in convnets (with images) -- non-uniform densities in natural point clouds. To deal with those non-uniform densities, we further propose special layers that are able to intelligently aggregate information from different scales.

In this repository we release code and data for our PointNet++ classification and segmentation networks as well as a few utility scripts for training, testing and data processing and visualization.

### Installation

Install <a href="https://www.tensorflow.org/install/">TensorFlow</a>. The code is tested under TF1.2 GPU version and Python 2.7 (version 3 should also work) on Ubuntu 14.04. There are also some dependencies for a few Python libraries for data processing and visualizations like `cv2`, `h5py` etc. It's highly recommended that you have access to GPUs.


### Usage

#### image edge detection

To train a PointNet++ model to classify ModelNet40 shapes (using point clouds with XYZ coordinates):

        python train.py

To see all optional arguments for training:

        python train.py -h

If you have multiple GPUs on your machine, you can also run the multi-GPU version training (our implementation is similar to the tensorflow <a href="https://github.com/tensorflow/models/tree/master/tutorials/image/cifar10">cifar10 tutorial</a>):

        CUDA_VISIBLE_DEVICES=0,1 python train_multi_gpu.py --num_gpus 2

After training, to evaluate the classification accuracies (with optional multi-angle voting):

        python evaluate.py --num_votes 12 

<i>Side Note:</i> For the XYZ+normal experiment reported in our paper: (1) 5000 points are used and (2) a further random data dropout augmentation is used during training (see commented line after `augment_batch_data` in `train.py` and (3) the model architecture is updated such that the `nsample=128` in the first two set abstraction levels, which is suited for the larger point density in 5000-point samplings.

To use normal features for classification: You can get our sampled point clouds of ModelNet40 (XYZ and normal from mesh, 10k points per shape) at this <a href="https://1drv.ms/u/s!ApbTjxa06z9CgQfKl99yUDHL_wHs">OneDrive link</a>. Move the uncompressed data folder to `data/modelnet40_normal_resampled`

#### video edge detection

To train a model to segment object parts for ShapeNet models:

        cd part_seg
        python train.py

Preprocessed ShapeNetPart dataset (XYZ, normal and part labels) can be found <a href="https://1drv.ms/u/s!ApbTjxa06z9CgQnl-Qm6KI3Ywbe1">here</a>. Move the uncompressed data folder to `data/shapenetcore_partanno_segmentation_benchmark_v0_normal`


### License
Our code is released under MIT License (see LICENSE file for details).

### Updates

### To do 
* Add support for multi-gpu training for the classification task.
* Add support for video edge detection task.

### Related Projects

<a href="https://github.com/s9xie/hed"></a> 