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
I implement the edge detection model according to the <a href="https://github.com/s9xie/hed">HED</a>  model in pytorch. 

the result of my pytorch model will be released in the future

| Method |ODS F-score on BSDS500 dataset |ODS F-score on NYU Depth dataset|
|:---|:---:|:---:|
| Ours| *** | ***  |
| Reference[1]| 0.790    |   0.746  |



the following is the original introduction of HED paper:

The model develop a new edge detection algorithm, holistically-nested edge detection (HED), which performs image-to-image prediction by means of a deep learning model that leverages fully convolutional neural networks and deeply-supervised nets. HED automatically learns rich hierarchical representations (guided by deep supervision on side responses) that are important in order to resolve the challenging ambiguity in edge and object boundary detection. We significantly advance the state-of-the-art on the BSD500 dataset (ODS F-score of .790) and the NYU Depth dataset (ODS F-score of .746), and do so with an improved speed (0.4s per image). Detailed description of the system can be found in the paper.

### Installation

Install <a href="https://pytorch.org/">pytorch</a>. The code is tested under 0.4.1 GPU version and Python 3.6  on Ubuntu 16.04. There are also some dependencies for a few Python libraries for data processing and visualizations like `cv2` etc. It's highly recommended that you have access to GPUs.

### Usage

#### image edge detection

To train a HED model on BSDS500:

        python train_hed.py

If you have multiple GPUs on your machine, you can also run the multi-GPU version training:

        CUDA_VISIBLE_DEVICES=0,1 python train_multi_gpu.py --num_gpus 2

After training, to evaluate:

        python evaluate.py --num_votes 12 

<i>Side Note:</i>  Hello mingyang, I love you

### License
Our code is released under MIT License (see LICENSE file for details).

### Updates

### To do 
* Add support for multi-gpu training for the edge detetion task.

### Related Projects

<a href="https://github.com/s9xie/hed">HED</a> 