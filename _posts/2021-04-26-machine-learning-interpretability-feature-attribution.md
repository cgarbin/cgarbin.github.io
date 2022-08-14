---
title:  "Machine learning interpretability with feature attribution"
excerpt: "There are many discussions in the machine learning (ML) community about model interpretability and explainability. The discussions take place in several contexts, ranging from using interpretability and explainability techniques to increase the robustness of a model, all the way to increasing end-user trust in a model."
date:   2021-04-26
tags: [machine-learning, explainability, interpretability, shap]
toc: true
---

There are many discussions in the machine learning (ML) community about model interpretability and explainability. The discussions take place in several contexts, ranging from using interpretability and explainability techniques to increase the robustness of a model, all the way to increasing end-user trust in a model.

This article investigates one method for model interpretability, feature attribution.

<!--more-->

Feature attribution methods "[indicate how much each feature in your model contributed to the predictions for each given instance.](https://cloud.google.com/ai-platform/prediction/docs/ai-explanations/overview)" They work with tabular data, text, and images. The following pictures show an example for each case.

An example of feature attribution for text (from [Explainable AI: A Review of Machine Learning Interpretability Methods](https://www.mdpi.com/1099-4300/23/1/18#)):

![Feature attribution - text](/images/2021-04-26/example-feature-attribution-text.png)

An example of feature attribution for tabular data (from [SHAP tutorial - official documentation](https://shap.readthedocs.io/en/latest/example_notebooks/tabular_examples/tree_based_models/Catboost%20tutorial.html)):

![Feature attribution - tabular](/images/2021-04-26/example-feature-attribution-tabular.png)

An example of feature attribution for a model that identifies a cat in a picture (from [LIME's GitHub](https://github.com/marcotcr/lime)):

![Feature attribution for image identification](/images/2021-04-26/example-feature-attribution-image.png)

## What feature attributions are used for

The prominent use cases for feature attribution are:

- _Debug models_: verify that models make predictions for the right reasons. For example, in the first picture below, a model predicts diseases in X-ray images based on the metal tags the X-ray technicians place on patients, not the actual disease marks (an example of [spurious correlation](https://arxiv.org/abs/1907.02893)).
- _Audit models_: verify that models are not looking at attributes that encode bias (gender, race, among others) when making decisions. For example, in the second picture below, the middle column shows a gender-biased model that predicts professions by looking at the face in the image. The rightmost column shows where a debiased model looks to make predictions.
- _Optimize models_: simplify correlated features and remove features that do not contribute to predictions.

The figure below ([source](https://journals.plos.org/plosmedicine/article?id=10.1371/journal.pmed.1002683)) is an example of feature attribution to debug a model (verify what the model uses to predict diseases). In this case, the model is looking at the wrong place to make predictions (using the X-ray markers instead of the pathology).

![Using interpretability to debug models](/images/2021-04-26/use-debug-model.png)

The figure below ([source](https://arxiv.org/abs/1610.02391)) is an example of feature attribution to audit a model. The middle column shows how the model predicts all women as "nurse", never as "doctor" -- an example of gender bias. The rightmost column shows a corrected model.

![Using interpretability to audit models](/images/2021-04-26/use-audit-model.png)

## Where feature attribution is in relation to other interpretability methods

[Explainability fact sheets](https://arxiv.org/abs/1912.05100) defines the following explanation families (borrowed from [Explanation facilities and interactive systems](https://dl.acm.org/doi/10.1145/169891.169951)):

- _Association between antecedent and consequent_: "model internals such as its parameters, feature(s)-prediction relations such as explanations based on feature attribution or importance and item(s)-prediction relations, such as influential training instances".
- _Contrast and differences_: "prototypes and criticisms (similarities and dissimilarities) and class-contrastive counterfactual statements".
- _Causal mechanism_: "a full causal model".

Feature attribution is part of the first family, the association between antecedent and consequent.

Using the framework in the [taxonomy of interpretable models](https://christophm.github.io/interpretable-ml-book/taxonomy-of-interpretability-methods.html), we can further narrow down feature attribution methods as:

- _Post-hoc_: They are usually used after the model is trained and usually with black-box models. Therefore, we are interpreting the results of the model, not the model itself (c)reating interpretable models is yet [another area of research](https://arxiv.org/abs/1811.10154)). The typical application for feature attribution is to interpret the predictions of black-box models, such as deep neural networks (DNNs) and random forests. These models are too complex to be directly interpreted. Thus we are left with interpreting the model's results, not the model itself.
- _Result of the interpretation method_: They result in feature summary statistics (and visualization - most summary statistics can be visualized in one way or another).
- _Model-agnostic or model-specific_: Shapley-value-based feature attribution methods can be used with different model architectures - they are model agnostic. Gradient-based feature attribution methods are based on gradients; therefore, they can be used only with models trained with gradient descent (neural networks, logistic regression, support vector machines, for example) - they are model specific.
- _Local_: They explain an individual prediction of the model, not the entire model (that would be "global" interpretability).

Putting it all together, feature attribution methods are post-hoc, local interpretation methods. They can be model-agnostic (e.g., SHAP) or model-specific (e.g., Grad-CAM).

## Limitations and traps of feature attribution

### Feature attributions are approximations

In their typical application, explanations have a fundamental limitation when applied to black-box models: they are approximations of how the model behaves.

> "[Explanations] cannot have perfect fidelity with respect to the original model. If the explanation was completely faithful to what the original model computes, the explanation would equal the original model, and one would not need the original model in the first place, only the explanation."

<cite>Cynthia Rudin</cite> --- [Stop Explaining Black Box Machine Learning Models for High Stakes Decisions and Use Interpretable Models Instead](https://arxiv.org/abs/1811.10154)
{: .small}

More succinctly:

> **"Explanations must be wrong."**

<cite>Cynthia Rudin</cite> --- [Stop Explaining Black Box Machine Learning Models for High Stakes Decisions and Use Interpretable Models Instead](https://arxiv.org/abs/1811.10154)
{: .small}

As we are going through the exploration of the feature attributions, we must keep in my mind that we are analyzing two items at the same time:

1. What the model predicted.
1. How feature attribution _approximates_ what the model considers to make the prediction.

Therefore, **never mistake the explanation for the actual behavior of the model**. This is a critical conceptual limitation to keep in mind.
{: .notice--warning}

### Feature attribution may not make sense

Feature attributions do not have any understanding of the model they are explaining. They simply explain what the model predicts, [not caring if the prediction is right or wrong](https://arxiv.org/abs/1811.10154).

![Explaining wrong predictions](/images/2021-04-26/explaining-wrong-prediction.png)

Therefore, **never confuse "explaining" with "understanding"**.
{: .notice--warning}

### Feature attributions are sensitive to the baseline

Another conceptual limitation is the choice of a baseline. The attributions are not absolute values. They are the contributions compared to a baseline. To better understand why baselines are important, see how Shapley values are calculated in the [Shapley values section](#shapley-values), then the section on baselines right after it.

### Feature attributions are slow to calculate

Moving on to practical limitations, an important one is performance. Calculating feature attributions for large images is time-consuming.

When used to help explain the predictions of a model to end-users, consider that it may make the user interface look unresponsive. You may have to compute the attributions offline or, at a minimum, indicate to the user that there is a task in progress and how long it will take.

### User interactions are complex

The attributions we get from the feature attributions algorithms are just numbers. To make sense of them, we need to apply visualization techniques.

For example, simply overlaying the raw attribution values on an image may leave out important pixels that contributed to the prediction, as illustrated in figure 2 of [this paper](http://ceur-ws.org/Vol-2327/IUI19WS-ExSS2019-16.pdf). Compare the number of pixels highlighted in the top-right picture with the one below it, adjusted to show more contributing pixels.

![Example of user interaction](/images/2021-04-26/user-interaction-example.png)

Showing all information at once to the users may also induce them to make more mistakes. For example, when showing the feature attributions overlaid to a medical image, [this paper](https://www.aaojournal.org/article/S0161-6420(18)31575-6/fulltext) found out that it increased overdiagnose of a medical condition. It points to the fact that just because we can explain something, we shouldn’t necessarily put that explanation in front of users without considering how it will change their behavior.

## Well-known feature attribution methods

The following table was compiled with the article [A Visual History of Interpretation for Image Recognition](https://thegradient.pub/a-visual-history-of-interpretation-for-image-recognition/) and the paper [Explainable AI: A Review of Machine Learning Interpretability Methods](https://www.mdpi.com/1099-4300/23/1/18).

Each row has an explanation method, when it was introduced, a link to the paper that introduced it, and an example of how the method attributes features. The entries are in chronological order.

| Method and introductory paper     | Feature attribution example (from the paper) |
| ----------- | ----------- |
| CAM (class activation maps)<br>2015-12<br> [Learning Deep Features for Discriminative Localization](https://arxiv.org/abs/1512.04150) | ![CAM example](/images/2021-04-26/method-example-cam.png) |
| LIME (local interpretable model-agnostic explanations)<br>2016-08<br>["Why Should I Trust You?": Explaining the Predictions of Any Classifier](https://arxiv.org/abs/1602.04938) | ![LIME example](/images/2021-04-26/method-example-lime.png) |
| Grad-CAM<br>2016-10<br>[Grad-CAM: Visual Explanations from Deep Networks via Gradient-based Localization](https://arxiv.org/abs/1610.02391) | ![Grad-CAM example](/images/2021-04-26/method-example-grad-cam.png) |
| Integrated gradients<br>2017-03<br>[Axiomatic Attribution for Deep Networks](https://arxiv.org/abs/1703.01365) | ![integrated gradients example](/images/2021-04-26/method-example-integrated-gradients.png) |
| DeepLIFT (Deep Learning Important FeaTures)<br>2017-04<br>[Learning Important Features Through Propagating Activation Differences](https://arxiv.org/abs/1704.02685) | ![DeepLIFT example](/images/2021-04-26/method-example-deeplift.png) |
| SHAP (SHapley Additive exPlanations)<br>2017-05<br>[A Unified Approach to Interpreting Model Predictions](https://arxiv.org/abs/1705.07874) | ![SHAP example](/images/2021-04-26/method-example-shap.png) |
| SmoothGrad<br>2017-06<br>[SmoothGrad: removing noise by adding noise](https://arxiv.org/abs/1706.03825) | ![SHAP example](/images/2021-04-26/method-example-smoothgrad.png) |
| Anchors<br>2018<br>[Anchors: High Precision Model-Agnostic Explanations](https://homes.cs.washington.edu/~marcotcr/aaai18.pdf) | ![Anchors example](/images/2021-04-26/method-example-anchors.png) |
| CEM (contrastive explanations method)<br>2018-02<br>[Explanations based on the Missing: Towards Contrastive Explanations with Pertinent Negatives](https://arxiv.org/abs/1802.07623) | ![CEM example](/images/2021-04-26/method-example-cem.png) |
| This looks like that<br>2018-06<br>[This Looks Like That: Deep Learning for Interpretable Image Recognition](https://arxiv.org/abs/1806.10574) | ![This looks like that example](/images/2021-04-26/method-example-this-looks-like-that.png) |
| XRAI<br>2019-06<br>[XRAI: Better Attributions Through Regions](https://arxiv.org/abs/1906.02825) | ![XRAI example](/images/2021-04-26/method-example-xrai.png) |
| Contrastive Explanations<br>2021-09<br>[Contrastive Explanations for Model Interpretability](https://arxiv.org/abs/2103.01378) | ![Contrastive explanations example](/images/2021-04-26/method-example-contrastive-explanations.png) |

## A feature attribution example with SHAP

SHAP (SHapley Additive exPlanations) was introduced in the paper [A Unified Approach to Interpreting Model Predictions](https://arxiv.org/abs/1705.07874). As the title indicates, SHAP [unifies](https://github.com/slundberg/shap#methods-unified-by-shap) LIME, Shapley sampling values, DeepLIFT, QII, layer-wise relevance propagation, Shapley regression values, and tree interpreter.

Because of SHAP's claim to unify several methods, in this section we review how it works. It starts with an example of SHAP for image classification, then explains the theory behind it. For a more detailed review of SHAP, including code, please see [this article]({% post_url 2021-04-25-shap-experiments-image-classification %}).

### Example with MNIST

The code for the examples described in this section is available on [this GitHub repository](https://github.com/fau-masters-collected-works-cgarbin/shap-experiments-image-classification).

The following figure shows the SHAP feature attributions for a convolutional neural network that classifies digits from the MNIST dataset.

The leftmost digit is the sample from the MNIST dataset. The text at the top shows the actual label from the dataset (8) and the label the network predicted (also 8, thus a correct prediction). The next ten digits are the SHAP feature attributions for each class (the digits zero to nine, from left to right). At the top of each class we see the probability assigned by the network. In this case, the network gave the probability 99.54% to the digit 8, so it's correct and very confident about the prediction.

![SHAP example with MNIST](/images/2021-04-26/shap-example-mnist.png)

SHAP uses colors to explain attributions:

- _Red pixels_ increases the probability of a class being predicted
- _Blue pixels_ decrease the probability of a class being predicted

We can see that the contours of the digit 8 are assigned high probability. We can also see that the empty space inside the top loop is relevant to detecting a digit 8. The empty spaces to the left and right of the middle, where the bottom and top half of the digit meet are also important. In other words, it's not only what is present that is important to decide what digit an image is, but also what is absent.

Looking at digits 2 and 3, we can see in blue the reasons why the network assigned lower probabilities to them.

![SHAP color coding example](/images/2021-04-26/shap-colors.png)

### Shapley values

SHAP uses an approximation of Shapley value for feature attribution. The Shapley value determines the contribution of individuals in interactions that involve multiple participants.

For example (based on [this article](https://storage.googleapis.com/cloud-ai-whitepapers/AI%20Explainability%20Whitepaper.pdf)), a company has three employees, Anne, Bob, and Charlie. The company has ended a month with a profit of 100 (the monetary unit is not essential). The company wants to distribute the profit to the employees according to their contribution.

We have so far two pieces of information, the profit when the company had no employee (zero) and the profit with all three employees on board.

| Employees | Profit |
| :- | -: |
| _None_ | 0 |
| Anne, Bob, Charlie | 100 |

Going through historical records, the company determined the profit when different combinations of employees were working in past months. They are added to the table below, between the two lines of the previous table.

| | Employees | Profit |
| -: | :- | -: |
| 1 | _None_ | 0 |
| 2 | Anne | 10 |
| 3 | Bob | 20 |
| 4 | Charlie | 30 |
| 5 | Anne, Bob | 60 |
| 6 | Bob, Charlie | 70 |
| 7 | Anne, Charlie | 90 |
| 8 | Anne, Bob, Charlie | 100 |

At first glance, it looks like Bob contributes 50 to the profit: in line 2 we see that Anne contributes 10 to the profit and in line 5 the profit of Anne and Bob together is 60. The conclusion would be that Bob contributed 50. However, when we look at line 4 (only Charlie) and line 6 (Bob and Charlie), we now conclude that Bob contributes 40 to the profit, contradicting the first conclusion.

Which one is correct? Both. We are interested in each employee's contribution when they are working together. _This is a collaborative game_.

To understand the individual contributions, we start by analyzing all possible paths to go from no employee to all three.

| Path | Combination to get to all employees |
| -: | :- |
| 1 | Anne → Anne, Bob → Anne, Bob, Charlie |
| 2 | Anne → Anne, Charlie → Anne, Bob, Charlie |
| 3 | Bob → Anne, Bob → Anne, Bob, Charlie |
| 4 | Bob → Bob, Charlie → Anne, Bob, Charlie |
| 5 | Charlie → Anne, Charlie → Anne, Bob, Charlie |
| 6 | Charlie → Bob, Charlie → Anne, Bob, Charlie |

We then calculate each employee's contribution in that path (this part is important). For example, in the first path, Anne contributes 10 (line 1 in the previous table), Bob contributes 50 (line 5, minus Anne's contribution of 10), and Charlie contributes 40 (line 8 in the previous table, minus line 5). The total contribution must add to the total profit (this part is also important): Anne = 10 + Bob = 50 + Charlie = 40 → 100.

Repeating the process above, we calculate each employee's contribution for each path. Finally, we average the contributions — **this is the Shapley value for each employee** (last line in the table).

| Path | Combination to get to all employees | Anne | Boob | Charlie |
| -: | :- | -: | -: | -: |
| 1 | Anne → Anne, Bob → Anne, Bob, Charlie | 10 | 50 | 40 |
| 2 | Anne → Anne, Charlie → Anne, Bob, Charlie | 10 | 10 | 80 |
| 3 | Bob → Anne, Bob → Anne, Bob, Charlie | 40 | 20 | 40 |
| 4 | Bob → Bob, Charlie → Anne, Bob, Charlie | 30 | 20 | 50 |
| 5 | Charlie → Anne, Charlie → Anne, Bob, Charlie | 30 | 40| 30 |
| 6 | Charlie → Bob, Charlie → Anne, Bob, Charlie | 60 | 10 | 30 |
| | **Average (Shapley value)** | **30** | **25** | **45** |

In this example we were able to calculate the contribution of each individual for all possible paths. In machine learning, the "individuals" are the features in the dataset. There may be thousands or even millions of features in a dataset. For example, in image classification, each pixel in the image is a feature.

SHAP uses a similar method to explain the contribution of features to the prediction of a model. However, calculating the contribution of each feature is not feasible in some cases (e.g. images and their millions of pixels). The combination of paths to try is exponential (factorial, to be precise). SHAP makes simplifications to calculate the features contributions. It is crucial to remember that **SHAP is an approximation, not the actual contribution value**.

### The importance of the baseline

In the example above, we asked "what is each employee's contribution to the profit?". Our baseline was the company with zero employees and no profit.

We could have asked a different question: "what is the contribution of Bob and Charlie, given that Anne is already an employee?". In this case, our baseline is 10, the profit that Anne adds to the company by herself. Only paths 1 and 2 would apply, with the corresponding changes to the average contribution.

SHAP (and other feature attribution methods) calculate the feature contribution compared to a baseline. For example, in feature attribution for image classification, the baseline is an image or a set of images.

_The choice of the baseline affects the calculations_. [Visualizing the Impact of Feature Attribution Baselines](https://distill.pub/2020/attribution-baselines/) discussed the problem and its effect on feature attribution.

## Appendix - interpretability vs. explainability

[Ajay Thampi's Interpretable AI](https://www.manning.com/books/interpretable-ai) book distinguishes between interpretability and explainability this way:

- _Interpretability_: "It is the degree to which we can consistently estimate what a model will predict given an input, understand how the model came up with the prediction, understand how the prediction changes with changes in the input or algorithmic parameters and finally understand when the model has made a mistake. Interpretability is mostly discernible by experts who are either building, deploying or using the AI system and these techniques are building blocks that will help you get to explainability."
- _Explainability_: "[G]oes beyond interpretability in that it helps us understand in a human-readable form how and why a model came up with a prediction. It explains the internal mechanics of the system in human terms with the intent to reach a much wider audience. Explainability requires interpretability as building blocks and also looks to other fields and areas such as Human-Computer Interaction (HCI), law and ethics."

Other sources treat interpretability and explainability as equivalent terms (for example, [Miller's work](https://arxiv.org/abs/1706.07269) and [Molan's online book on the topic](https://christophm.github.io/interpretable-ml-book/interpretability.html)).

This article uses "interpretability" as defined in Ajay Thampi's book. We distinguish between interpretability and explainability to not involve aspects of how to represent the interpretation of a model's prediction to end-users. This would add to the discussion other topics such as user interface and user interaction. While important for the overall discussion of ML interpretability and explainability, these topics are not relevant to the scope of this work. However, we preserve the original term when quoting a source. If the source chose "explainability", we quote it so.

Therefore, when we discuss "interpretability" here, we mean the interpretation that is shown to a machine learning practitioner, someone familiar with model training and evaluation. We discuss interpretability in a more technical format with this definition in place, assuming that the consumer of the interpretability results has enough technical background to understand it.
