### HED-pytorch: Holistically-Nested Edge Detection
created by XuanyiLi, if you have any problem in using it, please contact:xuanyili.edu@gmail.com.
#### my model result
the following are the side outputs and the prediction example
SGD no tunelr 1e-8:
![prediction example](https://github.com/meteorshowers/hed-pytorch/blob/master/doc/326025-sgd-notunelr.jpg)
Adam no tunelr 1e-4:
![prediction example](https://github.com/meteorshowers/hed-pytorch/blob/master/doc/326025-adam-notunelr-1e-4.jpg)

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
| Ours(SGD-notunelr-nogradenven-le-8)|0.767| ***  |
|ours(SGD-tunelr-gradenven-1e-6)| *** | *** |
|ours(ADAM-notunelr-nogradenven-1e-4)| 0.758(epoch1) 0.768(epoch2) 0.771（epoch 6） 0.769(epoch 10) | *** |
|ours(init dsn to zeros)| *** | *** |
| Reference[1]| 0.790    |   0.746  |


### Installation

Install <a href="https://pytorch.org/">pytorch</a>. The code is tested under 0.4.1 GPU version and Python 3.6  on Ubuntu 16.04. There are also some dependencies for a few Python libraries for data processing and visualizations like `cv2` etc. It's highly recommended that you have access to GPUs.

### Usage

#### image edge detection

To train a HED model on BSDS500:

        python train_hed.py

If you have multiple GPUs on your machine, you can also run the multi-GPU version training:

        CUDA_VISIBLE_DEVICES=0,1 python train_multi_gpu.py --num_gpus 2

After training, to evaluate:

        python evaluate.py

<i>Side Note:</i>  Hello mingyang, I love you

### License
Our code is released under MIT License (see LICENSE file for details).

### Updates

### To do 
* Add support for multi-gpu training for the edge detetion task.
* Improve the performance to 0.782 in the original paper.
* Add a gpu version of edge-eval code to accelerate the evaluation process.

### Related Projects
[1] <a href="https://github.com/s9xie/hed">HED</a> 
