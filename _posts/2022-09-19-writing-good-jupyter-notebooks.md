---
title:  "Writing good Jupyter notebooks"
excerpt: "How to write well-structured, understandable, flexible, and resilient Jupyter notebooks."
date:   2022-09-19
tags: [jupyter-notebooks, python, data-science]
toc: true
---

[Jupyter notebooks](https://jupyter.org/) are an excellent tool for data scientists and machine learning practitioners. However, if not approached with a few techniques, they can turn into a pile of unintelligible, unmaintainable code.

This post will discuss some techniques I use to write good Jupyter notebooks. We will start with a notebook that is not wrong but is not well written. We will progressively make changes to it until we arrive at a good notebook.

But first, what is a good Jupyter notebook? Good notebooks have the following properties:

- They are organized logically, with sections clearly delineated and named.
- They have important assumptions and decisions spelled out.
- Their code is easy to understand.
- Their code is flexible (easy to modify).
- Their code is resilient (hard to break).

<!--more-->

This post is adapted from a guest lecture I gave to [Dr. Marques'](https://www.ogemarques.com/) data science class. If you are pressed for time, check out the [GitHub repository](https://github.com/fau-masters-collected-works-cgarbin/writing-good-jupyter-notebooks), starting with the [presentation](https://github.com/fau-masters-collected-works-cgarbin/writing-good-jupyter-notebooks/blob/master/presentation.pdf).
{: .notice--info}

We will use as an example a notebook that attempts to answer the question _"is there gender discrimination in the salaries of an organization?"_ Our dataset is a list of salaries and other attributes from that organization. We will start from the first step in any data project, exploratory data analysis (EDA), clean up the dataset, and finally, attempt to answer the question.

To illustrate how to go from a notebook that is not wrong but is also not good, we will go through the following steps:

- [Step 1](#step-1---the-original-notebook): the original notebook, the one that lacks structure and proper coding practices.
- [Step 2](#step-2---add-a-description-organize-into-sections-add-exploratory-data-analysis): adds a description, organize into sections, add exploratory data analysis.
- [Step 3](#step-3---make-data-cleanup-more-explicit-and-explain-why-specific-numbers-were-chosen): make data cleanup more explicit and explain why specific numbers were chosen (the assumptions behind them).
- [Step 4](#step-4---make-the-code-more-flexible-with-constants-and-make-the-code-more-difficult-to-break): make the code more flexible with constants and make the code more difficult to break.
- [Step 5](#step-5---make-the-graphs-easier-to-read): make the graphs easier to read.
- [Step 6](#step-6---describe-the-limitations-of-the-conclusion): describe the limitations of the conclusion.

## Step 1 - The original notebook

[This is the original notebook](https://github.com/fau-masters-collected-works-cgarbin/writing-good-jupyter-notebooks/blob/master/salary-discrimination-by-gender-step-1.ipynb). It is technically correct, but far from what is acceptable for a project of this importance.

The first hint of a problem is the structure of the notebook: it doesn't have any. It's a collection of cells, one after the other.

![Step 1 - This notebook has no structure and other problems](/images/2022-09-19/step-1.drawio.png){: .align-center style="width:66%;"}

Other problems with this notebook:

1. There is no description of what the notebook is about.
1. There is no exploratory data analysis (EDA) to explain why we can (or cannot) trust our data.
1. The data cleanup (the magic numbers) is not explained, e.g. why were those numbers used?
1. Because of the magic numbers, the code is not flexible. We don't know where they are used and the effect of changing one of them.
1. There is no explanation for the code blocks.
1. There is no explanation for the conclusion.

We will fix some of the issues in the next step.

## Step 2 - Add a description, organize it into sections, and add exploratory data analysis

Starting in this step, we will make incremental changes to the notebook. Each change will bring us closer to a good notebook. Changes from the previous step are highlighted with a "REWORK NOTE" comment and an explanation of what has changed. Here is an example:

![Rework note](/images/2022-09-19/rework-note.drawio.png){: .align-center}

In this step, we make the following improvements:

1. Add a clear "what is this notebook about?" description.
1. Add an exploratory data analysis (EDA) section.
1. Split the notebook into sections.

![Step 2 - Add sections headers and EDA](/images/2022-09-19/step-2.drawio.png){: .align-center style="width:66%;"}

[This is the reworked notebook](https://github.com/fau-masters-collected-works-cgarbin/writing-good-jupyter-notebooks/blob/master/salary-discrimination-by-gender-step-2.ipynb). It is better, but we can still improve it:

1. Make the data cleanup more explicit.
1. Explain what the code blocks are doing.
1. Explain why specific numbers were chosen (the assumptions behind them).
1. Make the graphs easier to read.
1. Make the code more flexible with constants.
1. Make the code more resilient (harder to break).
1. Describe the limitations of the conclusion.

We will fix some of the issues in the next step.

## Step 3 - Make data cleanup more explicit and explain why specific numbers were chosen

In this step, we make the following improvements:

1. Make the data cleanup more explicit.
1. Explain why specific numbers were chosen (the assumptions behind them).
1. Explain what the code blocks are doing.

In the following figure we explain why we are removing all employees that are 66 or older and add a reference to back up our decision (the hyperlink in the text). We also explain what this piece of code is doing in detail.

![Step 3 - Making data cleanup more explicit](/images/2022-09-19/step-3.drawio.png){: .align-center style="width:66%;"}

[This is the reworked notebook](https://github.com/fau-masters-collected-works-cgarbin/writing-good-jupyter-notebooks/blob/master/salary-discrimination-by-gender-step-3.ipynb).

## Step 4 - Make the code more flexible with constants and make the code more difficult to break

In this step, we make the following improvements:

- Make the code more flexible with constants. If we need to change decisions, for example the age cutoff, we have only one place to change.
- Make the code more difficult to break. By following patterns, we reduce the chances of introducing bugs.

In this piece of code we remove everyone who made less than the minimum age working full time (see the [notebook](https://github.com/fau-masters-collected-works-cgarbin/writing-good-jupyter-notebooks/blob/master/salary-discrimination-by-gender-step-4.ipynb) for details).

![Step 4 - Salary cutoff](/images/2022-09-19/step-4.1.drawio.png){: .align-center style="width:66%;"}

There are a few notable items in this code:

1. We use a constant, in case we need to make changes later (more flexible code).
1. We use a generic name for the constant, so we don't need to change it later if we change the cutoff value. If we had named it something more specific, like `MINIMUM_WAGE`, we would need to change the constant name later if we change the value. This makes the code less flexible and less resilient.
1. We print the results of the operation, so we can discuss with the domain experts if our decision makes sense. For example, we could ask an HR representative if they expected to see this many employers removed when we set this age cutoff. It may catch errors in the dataset or in the code.

Regarding the last item, printing the operation results: we, the data scientists, may not be the domain expert. In this case, we are not the HR people. We need to engage the HR people in the steps as much as we can to validate our decisions. Simple things, like printing the effect of some decisions (how many employees were removed with a filter) help validate the decisions.
{: .notice--info}

When we clean up the age column, we keep using the same patterns:

1. We create a filter for the data we want to exclude, as we did for the salary filter. Mixing up filters (exclude and include) makes the code brittle. It is easy to make a mistake if we have to think about the what type of filter, exclude or include, we are using for a column (an example of [extraneous cognitive load](https://en.wikipedia.org/wiki/Cognitive_load#Extraneous), a bad thing to have in the code).
1. We follow a pattern for the variable name. The salary one was named `SALARY_CUTOFF`, so this one is also suffixed with `..._CUTOFF`.
1. We choose a generic variable name. If we had named it something more specific, e.g. `RETIRED_AGE`, if we decide to change the age cutoff the `RETIRED_` part may no longer make sense. If we use a generic name instead (`AGE_CUTOFF`), the name still makes sense even if we change the age.

![Step 4 - Age cutoff, following the same patterns as the age cutoff](/images/2022-09-19/step-4.2.drawio.png){: .align-center style="width:66%;"}

[This is the reworked notebook](https://github.com/fau-masters-collected-works-cgarbin/writing-good-jupyter-notebooks/blob/master/salary-discrimination-by-gender-step-4.ipynb).

## Step 5 - Make the graphs easier to read

In this step, we make the graphs easier to read.

First, we add transparency when plotting multiple variables on the same graph.

This is the [pairplot ](https://seaborn.pydata.org/generated/seaborn.pairplot.html) from the previous step, without transparency:

![Step 5 - Pairplot without transparency](/images/2022-09-19/step-5.1.drawio.png){: .align-center style="width:66%;"}

And this is the pairplot with transparency:

![Step 5 - Pairplot with transparency](/images/2022-09-19/step-5.2.drawio.png){: .align-center style="width:66%;"}

Adding transparency lets us see the clusters of data, the areas where we have many data points, as opposed to the places where we have few data points. It helps identifies patterns in the data.

Another technique to make graphs readable is to [bin the data](https://en.wikipedia.org/wiki/Data_binning). This is the graph from the previous step that plots age vs. salary:

![Step 5 - Salary by age before binning](/images/2022-09-19/step-5.3.drawio.png){: .align-center style="width:66%;"}

It is impossible to see any pattern in such a graph. To make it more legible, we will [bin the data](https://en.wikipedia.org/wiki/Data_binning). But the question is "what bins make sense for this case?" Since we are analyzing salaries, we chose 22 as our first bin because this is usually the [age of graduation](https://nonpartisaneducation.org/Review/Resources/Int__lHigherEd_AppendixA.pdf). After that, we will bin every five years for the first years to account for rapid promotions and rises that happen at the start of a career, then bin every ten years for later stages in the career, where promotions are rarer. We also document those assumptions clearly to discuss them with the domain experts.

This is the new graph:

![Step 5 - Salary by age after binning](/images/2022-09-19/step-5.4.drawio.png){: .align-center style="width:66%;"}

[This is the reworked notebook](https://github.com/fau-masters-collected-works-cgarbin/writing-good-jupyter-notebooks/blob/master/salary-discrimination-by-gender-step-5.ipynb).

## Step 6 - Describe the limitations of the conclusion

We now have a good notebook. It is organized in sections, uses constants to make the code more understandable and resilient, the graphs are well formatted, and we added explanations for all assumptions and decisions.

We are now at the last step, where we present the conclusion to the original question, _"is there gender discrimination in the salaries of an organization?"_.

In real-life, complex questions don't always have simple answers. And that's the case here. We have a few limitations that prevent us from giving a definitive answer to the question. But we have enough to spur some action. Our job at this point is to document what we found and the limitations of our analysis.

In the conclusion section, we clearly document:

- That we used some proxy variables.
- Despite the dataset's limitations, we have tentative conclusions.
- That we need more precise data, but at the same time, we have enough to take action (and avoid (analysis paralysis)[https://en.wikipedia.org/wiki/Analysis_paralysis]).

![Step 6 - Conclusions and limitations](/images/2022-09-19/step-6.drawio.png){: .align-center style="width:66%;"}

[This is the final notebook](https://github.com/fau-masters-collected-works-cgarbin/writing-good-jupyter-notebooks/blob/master/salary-discrimination-by-gender-step-6.ipynb).

## Conclusion

We write notebooks for our stakeholders, not for ourselves.

To write good notebooks, we need to:

- Organize them logically so that the stakeholders can follow the analysis.
- Spell out critical assumptions and decisions so stakeholders can validate them (or change them).
- Make the code easy to understand, easy to change (flexible), and hard to break (resilient), so we can modify it confidently as we review the results with the stakeholders.

## Running the examples

The notebooks are available on [this GitHub repository](https://github.com/fau-masters-collected-works-cgarbin/writing-good-jupyter-notebooks).
