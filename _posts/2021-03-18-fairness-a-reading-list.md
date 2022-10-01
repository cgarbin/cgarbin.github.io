---
title:  "Fairness in machine learning: a reading list"
excerpt: "A list of resources to understand concepts and applications of fairness in machine learning (ML)."
date:   2021-03-18
tags: [machine-learning, bias, fairness, social-impact]
toc: true
header:
   overlay_image: /images/2021-03-18/justice.jpg
   caption: "Photo credit: [Ludmila Kvapilova, CC BY-SA 4.0, via Wikimedia Commons](https://commons.wikimedia.org/wiki/File:Justice.tif)"
sidebar:
  title: ""
  nav: sidebar-2021-03-18
---

This article lists resources to understand concepts and applications of fairness in machine learning (ML).

<!--more-->

## Sources for people in a hurry

### "I can dedicate at most one hour of my life to fairness in ML"

In that case, watch the video [21 fairness definitions and their politics](https://fairmlbook.org/tutorial2.html).

Narayanan is an enganging speaker. He is also well-grounded in the subject, as one of the authors of the [fairmlbook.org book (Fairness and Machine Learning: Limitations and Opportunities)](https://fairmlbook.org/). In one hour he covers the complexity of the topic and the state of the research on it (as of 2018, but the fundamentals of the problem are still the same). This is a good source to understand the complexity of the problem and why solutions are not easy (and sometimes contradictory).

<!--more-->

### "If I could recommend only one source…"

Of all the sources below, if I could recommend only one (well, one for concepts, one for visualization, and one for a programming project):

- Concepts: [Fairness and Machine Learning: Limitations and Opportunities](https://fairmlbook.org/)
- Visualization: [Measuring Fairness explorable](https://pair.withgoogle.com/explorables/measuring-fairness/)
- In practice (programming): [Fairness \| Machine Learning Crash Course](https://developers.google.com/machine-learning/crash-course/fairness/video-lecture)

## Other sources

### Conceptual

This section lists sources to understand the concepts of fairness and their implications for society, in no particular order.

[A Framework for Understanding Sources of Harm throughout the Machine Learning Life Cycle](https://arxiv.org/abs/1901.10002)

Bias is closely related to fairness. This paper describes a framework to understand sources of bias in machine learning. Once we understand where bias comes from, we are better positioned to eliminate or at least mitigate it. The picture below summarizes the framework, illustrating the sources of bias in machine learning.

![A Framework for Understanding Sources of Harm throughout the Machine Learning Life Cycle](/images/2021-03-18/sources-of-bias.png)

[Fairness and Machine Learning: Limitations and Opportunities](https://fairmlbook.org/)

Also known as the "fair ML book", from the site URL, [fairmlbook.org](https://fairmlbook.org/). A free online book from luminaries of the field. It's updated frequently. If we could have only one reference for concepts, this would be it.

[CS 294: Fairness in Machine Learning](https://fairmlclass.github.io/)

From the authors of [fairmlbook.org](https://fairmlbook.org/) (previous item). A note at the top says "For an updated resource, please see fairmlbook.org." However, it is still a good source because the sequence of lectures is a structured way to understand/explore fairness and has many pointers to other references.

[21 fairness definitions and their politics](https://fairmlbook.org/tutorial2.html)

Continuing the [fairmlbook.org](https://fairmlbook.org/) theme, this is a one-hour presentation by one of the authors. It is a good source to learn in a short time the complexities of the field (and thus, the complexity of the solutions).

### Keeping up with the latest research

Visit the [Papers With Code fairness section](https://paperswithcode.com/task/fairness) frequently for the latest papers, libraries, and datasets on the topic.

### Recent survey papers

These are some recent survey papers on fairness as of early 2021. Each has a brief extract to help explain why it is relevant and what aspects it covers.

[A Survey on Bias and Fairness in Machine Learning](https://arxiv.org/abs/1908.09635)

> In this survey we investigated different real-world applications that have shown biases in various ways, and we listed different sources of biases that can affect AI applications. We then created a taxonomy for fairness definitions that machine learning researchers have defined in order to avoid the existing bias in AI systems. In addition to that, we examined different domains and subdomains in AI showing what researchers have observed with regard to unfair outcomes in the state-of-the-art methods and how they have tried to address them.

[The Ethics of AI Ethics -- An Evaluation of Guidelines](https://arxiv.org/abs/1903.03425)

> Current advances in research, development and application of artificial intelligence (AI) systems have yielded a far-reaching discourse on AI ethics. In consequence, a number of ethics guidelines have been released in recent years. [...] Designed as a comprehensive evaluation, this paper analyzes and compares these guidelines highlighting overlaps but also omissions. As a result, I give a detailed overview of the field of AI ethics. Finally, I also examine to what extent the respective ethical principles and values are implemented in the practice of research, development and application of AI systems – and how the effectiveness in the demands of AI ethics can be improved.

[From What to How: An Initial Review of Publicly Available AI Ethics Tools, Methods and Research to Translate Principles into Practices](https://arxiv.org/abs/1905.06876)

> [O]ur intention in presenting this research is to contribute to closing the gap between principles and practices by constructing a typology that may help practically-minded developers apply ethics at each stage of the pipeline, and to signal to researchers where further work is needed. The focus is exclusively on Machine Learning, but it is hoped that the results of this research may be easily applicable to other branches of AI. The article outlines the research method for creating this typology, the initial findings, and provides a summary of future research needs.

[50 Years of Test (Un)fairness: Lessons for Machine Learning](https://dl.acm.org/doi/10.1145/3287560.3287600)

> We compare past and current notions of fairness along several dimensions, including the fairness criteria, the focus of the criteria (e.g., a test, a model, or its use), the relationship of fairness to individuals, groups, and subgroups, and the mathematical method for measuring fairness (e.g., classification, regression). This work points the way towards future research and measurement of (un)fairness that builds from our modern understanding of fairness while incorporating insights from the past.

[A Framework for Fairness: A Systematic Review of Existing Fair AI Solutions](https://arxiv.org/abs/2112.05700)

> A large portion of fairness research has gone to producing tools that machine learning practitioners can use to audit for bias while designing their algorithms. Nonetheless, there is a lack of application of these fairness solutions in practice. This systematic review provides an in-depth summary of the algorithmic bias issues that have been defined and the fairness solution space that has been proposed. Moreover, this review provides an in-depth breakdown of the caveats to the solution space that have arisen since their release and a taxonomy of needs that have been proposed by machine learning practitioners, fairness researchers, and institutional stakeholders

### Social and legal implications

Not all aspects of machine learning fairness are technical. We care about fairness because it affects humans at the individual and societal levels. These are some papers that look at the social and legal implications of fairness in machine learning.

[This Thing Called Fairness: Disciplinary Confusion Realizing a Value in Technology](https://arxiv.org/abs/1909.11869)

> [T]his paper examines the value of shared vocabularies, analytics, and other tools that facilitate conversations about values in light of these disciplinary specific conceptualizations, the role such tools play in furthering research and practice, outlines different conceptions of "fairness" deployed in discussions about computer systems, and provides an analytic tool for interdisciplinary discussions and collaborations around the concept of fairness. We use a case study of risk assessments in criminal justice applications to both motivate our effort--describing how conflation of different concepts under the banner of "fairness" led to unproductive confusion--and illustrate the value of the fairness analytic by demonstrating how the rigorous analysis it enables can assist in identifying key areas of theoretical, political, and practical misunderstanding or disagreement, and where desired support alignment or collaboration in the absence of consensus.

My (Christian's) commentary: highly analytical, with strong definitions of fairness from different points of view (section 5). Then it tackles the controversial COMPAS (Section 7) system and argues, among other points, that analyzing only the algorithm and not the entire system is shortsighted. Appendix A, "An Analytic for applying contested conceptions of fairness in computer systems," is worth the paper alone.

[On the Legal Compatibility of Fairness Definitions](https://arxiv.org/abs/1912.00761)

> Past literature has been effective in demonstrating ideological gaps in machine learning (ML) fairness definitions when considering their use in complex sociotechnical systems. However, we go further to demonstrate that these definitions often misunderstand the legal concepts from which they purport to be inspired, and consequently inappropriately co-opt legal language. In this paper, we demonstrate examples of this misalignment and discuss the differences in ML terminology and their legal counterparts [...].

### Healthcare specific

[Potential Biases in Machine Learning Algorithms Using Electronic Health Record Data](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6347576/)

> This Special Communication outlines the potential biases that may be introduced into machine learning–based clinical decision support tools that use electronic health record data and proposes potential solutions to the problems of overreliance on automation, algorithms based on biased data, and algorithms that do not provide information that is clinically meaningful.

## Bias and fairness

Bias is a close cousin to fairness. Read more about bias in [this post]({% post_url 2021-02-01-bias-data-science-machine-learning %}).
