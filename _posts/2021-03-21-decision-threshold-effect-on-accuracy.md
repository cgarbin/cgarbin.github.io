---
layout: post
title:  "What is \"model accuracy\", really?"
date:   2021-03-21
categories: post
---

{% newthought 'In the book' %} [Responsible Machine Learning](https://www.h2o.ai/resources/ebook/responsible-machine-learning/),
when discussing trust and risk, the authors recommend a list of questions to ask to understand the
risk of a machine learning (ML) deployment.

One of the questions is **"What is the quality of the model? (Accuracy, AUC/ROC, F1)"**. These
metrics compare correct and incorrect predictions of a model.

But how exactly a model determines what a correct prediction is?

<!--more-->

Here we will analyze the effect of an important factor a model uses to decide the correct
prediction (label) for classification problems, the **decision threshold**. We will see that
without understanding how a model decides what "correct" is, talking about the model accuracy
is premature.

We use _accuracy_ in this text as the number of correct predictions on the test set, divided by the
number of instances in the test set.

$$ Accuracy = {Number\ of\ correct\ predictions \over Number\ of\ instances\ predicted} $$

To illustrate the discussion, we will use an image classification model. {%marginnote 'mg-simplification' 'Simplification disclaimer: there are other types of problems, e.g. regression, and other types of
models -- we are making simplifications to expose the main concept.' %}

A typical image classification problem, taught early in machine learning, is digit classification with the
[MNIST dataset](http://yann.lecun.com/exdb/mnist/). The dataset looks like this (a small sample -
the dataset has 70,000 images):

{% maincolumn './images/2021-03-21/mnist.png' 'Sample digits from the MNIST dataset' %}

In an image classification problem, we train a model to identify an image's class (label).
In this case, there are ten classes, one for each digit (from zero to nine).

{% maincolumn './images/2021-03-21/digit-classification-model.png' 'Digit classification model' %}

This is an actual digit from MNIST. The model correctly classifies it as the digit "2".

{% maincolumn './images/2021-03-21/digit-classification-example.png' 'Classification example' %}

A neural network has several hidden layers to extract ("learn") features from the images. The very
last layer is the one that classifies the image. In this case, we are classifying ten classes (ten
digits). Therefore the last layer has ten neurons, one for each digit.

{% maincolumn './images/2021-03-21/classification-layer.png' 'Classification layer' %}

Because we want to know what digit it is, we use [softmax activation](https://www.tensorflow.org/api_docs/python/tf/keras/activations/softmax)
in the last layer to give us a probability distribution of each class. The model
is confident that the image is a number "2" in the case below.

{% maincolumn './images/2021-03-21/model-classification-certain.png' 'Model classification certain' %}

For other images, the model may not be so confident.

{% maincolumn './images/2021-03-21/model-classification-not-certain.png' 'Model classification not certain' %}

In those cases, how should we decide what the label is?

{% maincolumn './images/2021-03-21/model-classification-how-to-decide.png' 'Model classification - how to decide' %}

Most of the time, the class with the largest probability is used as the label. In this example, the
model classifies the image as the digit "2".

{% maincolumn './images/2021-03-21/model-classification-use-largest.png' 'Model classification - largest probability' %}

But what should the model do when the largest probability is not that high and is close to the
probability of other classes?

{% maincolumn './images/2021-03-21/model-classification-uncertain.png' 'Model classification - uncertain' %}

In the example below, the largest probability is for the class "9", but it is not even 50% and the
probability for class "4" is not too far behind. The model does not have high confidence in this
prediction.

{% maincolumn './images/2021-03-21/model-classification-uncertain2.png' 'Model classification - uncertain' %}

What should we do in these cases?

To solve those cases, we usually pick a threshold for the decision. Instead of simply using the class
with the maximum probability, we select the largest probability above the threshold we chose. If we
choose 50% as the threshold, in the number "2" example above we are still able to classify the image
as the number "2".

{% maincolumn './images/2021-03-21/model-classification-threshold-above.png' 'Model classification - above threshold' %}

But now we no longer classify the ambiguous image as a number "9". In this case, we would not make
a decision at all.

{% maincolumn './images/2021-03-21/model-classification-threshold-below.png' 'Model classification - below threshold' %}

But what threshold do we pick?

It depends. For high-stakes applications, where wrong decisions have severe consequences, we want to
be very confident in the model's prediction.

For example, for an automatic check deposit application, we want the model to be at least 99%
confident of the prediction. Any image below that threshold is sent to human review.

{% maincolumn './images/2021-03-21/model-classification-high-stakes.png' 'Model classification - high stakes' %}

## Effect of different thresholds

The higher the threshold for the decision, the fewer images the model can classify. For the model
used in these examples, this is the effect of different thresholds on the model's accuracy.

| Threshold | Accuracy |
| --------: | -------: |
|    99.99% |    48.7% |
|     99.9% |    75.6% |
|       99% |    90.0% |
|       90% |    96.4% |
|       80% |    97.8% |
|       75% |    97.8% |
|       67% |    98.2% |
|       50% |    98.8% |

## Asking questions about "accuracy"

{% newthought 'The one-line takeaway' %}: _to use a model responsibly **we must ask questions** about how its accuracy
was measured and not just accept published numbers_.

1. How predictions are being made: is it probability-based (as in the examples above)? Something
   else?
1. What factors control the predictions: is it threshold-based or some other decision (e.g. argmax)?
   If it is threshold-based, what are the thresholds?

_"We achieved 99.9% accuracy on [some task here]"_ means nothing if it's not accompanied by a
detailed description of what a "correct prediction" is for the model.

## Experimenting with the code

The code is available on [this GitHub repository](https://github.com/fau-masters-collected-works-cgarbin/decision-threshold-effect-on-accuracy). You can experiment with different digits and classification thresholds to see the effect on the model's accuracy.
