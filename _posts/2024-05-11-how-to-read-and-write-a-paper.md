---
title:   "Improve writing by learning how to read"
excerpt: "Turn the advice in \"How to Read a Paper\" around to write a good paper."
date:    2024-05-05
last_modified_at: 2024-05-05
tags: [writing, reading, papers]
toc: true
sidebar:
  title: ""
  nav: sidebar-2024-05-05
---

The advice in _[How to Read a Paper](http://ccr.sigcomm.org/online/files/p83-keshavA.pdf)_ changed how I read scientific papers. I used to read them linearly, struggling through each section in order. The three-pass approach was liberating. It freed my mind from having to understand everything the first time.

Eventually, I realized I could turn the advice around to write a good paper.

<!--more-->

Most of what follows applies to scientific papers. However, we can use the same principles for other types of writing.

## What makes a good paper?

Good papers have, at a minimum, these qualities:

1. They are correct. Their claims are supported by evidence and are internally consistent.
1. They are easy to read. They are well-structured, with clear language, good grammar and attention to detail.

The first quality is exclusionary. An incorrect paper does not benefit from any other quality. We will spend the rest of this post discussing the second quality.

## How to write a good paper

Here, we will apply the advice from _How to Read a Paper_ to writing a good paper. We will use the three-pass approach and see how it applies to writing.

### The first pass

The main point of the first pass is to convince the user that the paper's topic is worth reading and that it is well structured.

> 1. Carefully read the title, abstract, and introduction
> 2. Read the section and sub-section headings, but ignore everything else
> 3. Read the conclusions

<cite>S. Keshav</cite> --- [How to Read a Paper](http://ccr.sigcomm.org/online/files/p83-keshavA.pdf)
{: .small}

How to turn that "read" advice into "write" advice:

1. **Choose a title that communicates the paper's main point**. Don't try to be clever. The title should be clear and concise. It should tell the reader what the paper is about.
1. **Write a short, to the point abstract**. This is the first opportunity to motivate the reader. A good abstract explains the research problem, why it is important to work on it, the challenges, and the main results in a few sentences. Note that these are fundamental questions. You may not be ready to write the paper if you can't answer them.
1. **Write a clear introduction that sets the stage for the rest of the paper**. Use it to entice the reader to keep reading. The introduction should cover the same items as the abstract but in more detail.
1. **Choose section and subsection titles that tell a story**. The section titles for scientific papers often follow a rigid structure (introduction, related work, methodology, results, discussion, conclusion). However, we have more freedom for the subsections. Use precise and concise titles that tell the reader what to expect. For example, "Approach 1" and "Approach 2" are not good subsection titles. Better titles to help pique the reader's interest are "Approach 1: Using a neural network" and "Approach 2: Using a decision tree".

Here are a few lessons that took me a while to learn:

1. If I don't have good answers for the fundamental items in the abstract, my research is not yet ready. I may even have a problem with the research topic and scope, a fundamental issue that needs to be addressed before spending more time on the research.
1. I do not need to write the abstract and introduction first. Writing them last may be easier (as long as the abstract items have been answered -- this is about writing the abstract, not the research itself).
1. In fact, writing a paper is not a linear process. I may write the results first, then go back to methods, then write the introduction, the abstract, the discussion, and finally, the conclusion. As long as the research is solid, choose the order that makes it easier to write.
1. But having a roadmap helps. I write a table of contents before starting to write. It helps me see the big picture and how to break down the sections into logical and engaging subsections.

### The second pass

The main point of the second pass is to help the reader understand the paper's content.

> 1. Look carefully at the figures, diagrams and other illustrations in the paper. Pay special attention to graphs.
Are the axes properly labeled? Are results shown with
error bars, so that conclusions are statistically significant? Common mistakes like these will separate
rushed, shoddy work from the truly excellent.
> ...
>
> After this pass, you should be able to grasp the content of the paper. You should be able to summarize the main thrust of the paper, with supporting evidence, to someone else.

<cite>S. Keshav</cite> --- [How to Read a Paper](http://ccr.sigcomm.org/online/files/p83-keshavA.pdf)
{: .small}

How to turn that "read" advice into "write" advice:

1. **Don't rely on text alone to convey your ideas**. Support the text with figures, tables, and diagrams.
   1. Chris Olah's blog has superb examples of figures and diagrams supporting the text explanations, such as [the one on how LSTM works](https://colah.github.io/posts/2015-08-Understanding-LSTMs/).
1. **Use detailed captions for figures, tables, and diagrams**. Assume the reader will read only the captions and none of the paper's text. The captions should be self-contained and explain the main points. "Results for approach 1" is a bad caption. A better caption to keep the reader engaged is "Result from experiments for approach 1, using neural networks to solve the problem. The graph shows it performs well in the first ten epochs, then overfits. This problem sparked the idea for approach 2 (figure 2)."
1. **Avoid trivial mistakes that undermine the paper's credibility**. Trivial mistakes indicate sloppiness and make the reader doubt the paper's results.
   1. Make sure that the axes are properly labeled, that the figures have legends, and that the color schemes are clear and accessible (a [list of common errors and how to fix them](https://nickch-k.github.io/DataCommSlides/Easy_Mistakes_to_Avoid.html)).
   1. Carefully review table columns and row labels.
   1. Run the entire paper through a spell and grammar checker. In this day and age, there is no excuse for typos and grammar mistakes.

Here are a few lessons that that took me a while to learn:

1. Have a "hero picture" (or diagram). This picture summarizes or explains the most important concepts in the paper and is placed in visible places, such as the bottom of the first page or the top of the second page (and remember to write a self-contained caption). Readers are drawn to pictures. A good picture can make the reader want to read the paper. For example, the figure at the top of the second page [on this paper](https://arxiv.org/pdf/2105.03020) explains at a glance the main contributions of the paper: a large dataset curated by experts (self-promotion warning: I'm one of the authors, but the idea to put this picture strategically came from another coauthor -- I first thought it was a gimmick, but I now appreciate the value). As a bonus, this picture can be used as a [graphical abstract](https://en.wikipedia.org/wiki/Graphical_abstract).
1. Read the paper aloud, including captions (to another coauthor, if you have one). Seriously. This is the most effective of all the "how to make it easier to read" tips I know. If you can't read it aloud without stumbling, the reader will have a hard time reading it silently.

### The third pass

The main point of the third pass is to convince the user that the paper's results are significant and well-supported.

> The key to the third pass is to attempt to virtually re-implement the paper: that is, making the same assumptions as the authors, re-create the work. By comparing this re-creation with the actual paper, you can easily identify not only a paper’s innovations, but also its hidden failings and assumptions.

<cite>S. Keshav</cite> --- [How to Read a Paper](http://ccr.sigcomm.org/online/files/p83-keshavA.pdf)
{: .small}

How to turn that "read" advice into "write" advice:

1. **Ensure that the results are statistically significant**. Use error bars, p-values, or other statistical measures to show that the results are not due to chance.
1. **Perform [ablation studies](https://en.wikipedia.org/wiki/Ablation_(artificial_intelligence))** to show the impact of different components of your approach and to prove that the results come from your approach, not other factors.

Here are a few lessons that that took me a while to learn:

1. Anticipate questions. If you were a reviewer, what would you ask? Answer those questions in the paper. Ask a trusted colleague to read the paper and ask them what questions they have. Don't disregard their questions as "obvious" or "unimportant." If they have those questions, so will the reviewers.
1. At the same time, keep the main body brief and use appendices for additional information. Keep the main body focused on the main points, then use the appendices to provide additional information for the curious reader.

## Above all, don't lose the reader in the first pass

If you remember only one thing from this post: **the first pass is so important that it may be the last**. Don't lose the reader in the first pass.

Or, as Keshav puts it:

> "[W]hen you write a paper, you can expect most reviewers (and readers) to make only one pass over it. Take care to choose coherent section and sub-section titles and to write concise and comprehensive abstracts. If a reviewer cannot understand the gist after one pass, the paper will likely be rejected; if a reader cannot understand the highlights of the paper after five minutes, the paper will likely never be read."

<cite>S. Keshav</cite> --- [How to Read a Paper](http://ccr.sigcomm.org/online/files/p83-keshavA.pdf)
{: .small}

## More reading on writing

- [The Science of Scientific Writing](https://www.americanscientist.org/blog/the-long-view/the-science-of-scientific-writing) argues that _"complexity of thought need not lead to impenetrability of expression; we demonstrate a number of rhetorical principles that can produce clarity in communication without oversimplifying scientific issues."_
- [Troubling Trends in Machine Learning Scholarship](https://arxiv.org/abs/1807.03341) says that _"papers are most valuable to the community when they act in service of the reader, creating foundational knowledge and communicating as clearly as possible."_ -- then proceeds to explain what prevents that and how to fix it.
- The "Writing papers" section in [Andrej Karpathy's _A Survival Guide to a PhD_](https://karpathy.github.io/2016/09/07/phd/). Advice from someone who has written and read many papers.
- [How to Read on the Web](https://www.nngroup.com/articles/how-users-read-on-the-web/) -- _"They don't. People rarely read Web pages word by word; instead, they scan the page, picking out individual words and sentences."_ -- shows how to help guide the reader's eyes to the most important parts of the page.
