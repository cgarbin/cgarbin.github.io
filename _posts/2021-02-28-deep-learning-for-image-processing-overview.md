---
title:  "An overview of deep learning for image processing"
excerpt: "Deep learning (large, multi-layered neural networks) have been successfully applied to computer vision tasks. This article reviews its origins, the evolution of network architectures, and recent developments."
date:   2021-04-26
tags: [machine-learning, deep-learning, computer-vision]
---

Deep learning revolutionized image processing. It made previous techniques, based on manual feature extraction, obsolete. This article reviews the progress of deep learning, with ever-growing networks and the new developments in the field.

<!--more-->

Deep learning is a sub-area of machine learning, which in turn is a sub-area of artificial intelligence ([picture source](https://commons.wikimedia.org/wiki/File:AI-ML-DL.svg)).

![Deep learning](/images/2021-02-28/AI-ML-DL.png)

The best way I found to explain deep learning is in contrast with traditional methods. Yann LeCun, one of the founders of deep learning, gave an [informative talk](https://www.youtube.com/watch?v=Qk4SqF9FT-M) on the evolution of learning techniques, starting with the traditional ones and ending with deep learning. He focuses on image recognition in that talk.

It is a worthwhile investment of one hour of our time to listen to someone who was not only present but actively driving the evolution of deep learning. The two pictures immediately below are from his speech.

## Traditional image recognition vs. deep learning

In traditional image recognition, we use hand-crafted rules to extract features from an image ([source](https://youtu.be/Qk4SqF9FT-M?t=305)).

![Traditional image processing](/images/2021-02-28/image-processing-traditional.png)

In contrast, deep learning image recognition is done with trainable, multi-layer neural networks. Instead of hand-crafting the rules, we feed labeled images to the network. The neural network, through the training process, extracts the features needed to identify the images ([source](https://youtu.be/Qk4SqF9FT-M?t=435)).

![Deep learning image processing](/images/2021-02-28/image-processing-deep-learning.png)

"Deep" comes from the fact that neural networks (in this application) use several layers. For example, LeNet-5, named after Yann LeCunn (of the presentation above) and shown in the (historic) picture below ([source](http://yann.lecun.com/exdb/publis/pdf/lecun-98.pdf)), has seven layers.

![Deep learning network example](/images/2021-02-28/lenet-5.png)

## What deep learning networks "learn"

Each layer "learns" ("extracts" is a better technical term) different aspects ("features" in the pictures above) of the images. Lower layers extract basic features (such as edges), and higher layers extract more complex concepts (that frankly, [we don't quite know how to explain yet](https://distill.pub/2017/feature-visualization/)).

The picture below ([source](https://distill.pub/2017/feature-visualization/)) shows the features that each layer of a deep learning network extracts. On the left, we have the first layers of the network. They extract basic features, such as edges. As we move to the right, we see the upper layers of the network and the features they extract.

![Visualization of features in layers of a network](/images/2021-02-28/layer-visualization.png)

Unlike traditional image processing, a deep learning network is not manually configured to extract these features. They learn it through the [training process](https://developers.google.com/machine-learning/crash-course/training-neural-networks/video-lecture).

## The evolution of deep learning

Deep learning for image processing entered the mainstream in the late 1990s when [convolutional neural networks](https://cs231n.github.io/convolutional-networks/) were applied to image processing. After stalling a bit in the early 2000s, deep learning took off in the early 2010s. In a short span of a few years, bigger and bigger network architectures were developed. Over time, what "deep" meant was stretched even further.

The table below shows the evolution of deep learning network architectures.

| When/What      | Notable features | Canonical depiction |
| ----------- | ----------- |  ----------- |
| 1990s<br>[LeNet](http://yann.lecun.com/exdb/publis/pdf/lecun-98.pdf) | Trainable network for image recognition.<br>- Gradient-based learning<br>- Convolutional neural network | ![LeNet](/images/2021-02-28/lenet-5.png) |
| 2012<br>[AlexNet](https://proceedings.neurips.cc/paper/2012/file/c399862d3b9d6b76c8436e924a68c45b-Paper.pdf) | One network outperformed, by a large margin, model ensembling (best in class at the time) in [ImageNet](https://www.image-net.org/).<br>- Deep convolutional neural network<br>- Overcame overfitting with data augmentation and dropout | ![AlexNet](/images/2021-02-28/alexnet.png) |
| 2014<br>[Inception](https://arxiv.org/pdf/1409.4842.pdf)<br>(GoogLeNet) | Very deep network (over 20 layers), composed of building blocks, resulting in a "network in a network" (inception). | Partial depiction<br>![Inception](/images/2021-02-28/inception.png) |
| 2014<br>[VGGNet](https://arxiv.org/pdf/1409.1556.pdf) | Stacks of small convolution filters (as opposed to one large filter) to reduce the number of parameters in the network. | ![AlexNet](/images/2021-02-28/vggnet.png) |
| 2015<br>[ResNet](https://arxiv.org/pdf/1512.03385.pdf) | Introduced skip connections (residual learning) to train very deep networks (152 layers). At the same time, the network is compact (few parameters for its size). | Partial depiction<br>![Inception](/images/2021-02-28/resnet.png) |

Network architectures continue to evolve today. So many architectures have been put into practice that we now need a [taxonomy to categorize them](https://arxiv.org/abs/1901.06032).

![CNN taxonomy](/images/2021-02-28/taxonomy.png)

## Recent trends

- _Efficiently scaling CNNs_: There are different ways to scale CNN-based networks. The [EfficientNet](https://arxiv.org/abs/1905.11946) family of networks shows that we don't always need large CNN networks to get good results.
- _Back to basics_: The [MLP-Mixer](https://arxiv.org/abs/2105.01601) network does away with CNN layers altogether. It uses only simpler multi-layer perceptron (MLP) layers, resulting in networks with faster throughput, predicting more images per second than other network architectures.
- _Transformers_: Transformer-based networks, after their success with natural language processing (NLP), [are being appied to image processing]({% post_url 2021-12-01-transformers-in-computer-vision %}).

## Keeping up with new developments

[Papers with Code](https://paperswithcode.com/) maintains a [leaderboard of the state of the art](https://paperswithcode.com/sota/image-classification-on-imagenet), including links to the papers that describe the network used to achieve each result.
