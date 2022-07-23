# Understanding transformers in one morning

This article has resources to understand transformers in one morning (four hours, give or take).

## Hour 1 - The paper

First, read Google AI Research's blog post [Google AI Blog: Transformer: A Novel Neural Network Architecture for Language Understanding](https://ai.googleblog.com/2017/08/transformer-novel-neural-network.html). Don't follow the links; just read the post. Then read the paper [Attention Is All You Need](https://arxiv.org/abs/1706.03762). Don't worry about understanding the details at this point. Get familiar with terminology and pictures.

The paper has about 6,000 words. It would take twenty minutes to read at the average reading pace of 300 words per minute. But it's a scientific paper, so it will take longer. Using the [three-pass approach](https://web.stanford.edu/class/ee384m/Handouts/HowtoReadPaper.pdf), let's reserve an hour to read it.

## Hour 2 - Key concepts

The second hour is about understanding the key concepts in the paper with Rasa's Algorithm Whiteboard video series.

- [Rasa Algorithm Whiteboard - Transformers & Attention 1: Self Attention <i class="fab fa-youtube" aria-hidden="true"></i>](https://www.youtube.com/watch?v=yGTUuEx3GkA&t=4s)(14 minutes): Explains **attention** first with a simple example using a time series, then with a text example. The video introduces **word embedding**, a key concept for NLP (natural language processing) models, including transformers. With these concepts explained, it defines **self-attention**.
- [Rasa Algorithm Whiteboard - Transformers & Attention 2: Keys, Values, Queries  <i class="fab fa-youtube" aria-hidden="true"></i>](https://www.youtube.com/watch?v=tIvKXrEDMhk)(13 minutes): Building on the previous video, it explains **keys, queries, and values**.  First, it explains the operations that make up the **attention layer** conceptually, as a process to add context to a value (you can think of a "value" as a "word" in this context). Since we are trying to create a model, it describes where we need to add trainable parameters (weights). With the concepts and weights in place, it reintroduces the operations as matrix operations that create the stackable **self-attention block**.
- [Rasa Algorithm Whiteboard - Transformers & Attention 3: Multi Head Attention <i class="fab fa-youtube" aria-hidden="true"></i>](https://www.youtube.com/watch?v=23XUv0T9L5c) (11 minutes): Using a phrase as an example, it explains why we need more than one attention head to understand the context where words are used (**multi-head attention**). The fact that the attention heads are independent is a crucial concept in transformers. It allows matrix operations for each head to run in parallel, significantly speeding up the training process.
- [Rasa Algorithm Whiteboard: Transformers & Attention 4 - Transformers <i class="fab fa-youtube" aria-hidden="true"></i>](https://www.youtube.com/watch?v=EXNBy8G43MM)(15 minutes):  With the foundational concepts explained, this video covers the pictures in the "Attention is All You Need" paper that make up the **transformer architecture**. The new concept introduced here is **positional encoding**. It ends by highlighting how the transformer architecture lends itself to **parallelization** in ways other attention architectures cannot.

We just finished the second hour of the morning understanding transformers. Rasa's videos are a great introduction but are still informal. That's not a bug. It's a feature. They introduce the key concepts in simple terms, making them easy to follow.

## Hour 3 - Digging into details

Now we will switch to a more formal introduction with these two lectures from professor [Peter Bloem](https://peterbloem.nl/), VU University in Amsterdam.

- [Lecture 12.1 Self-attention <i class="fab fa-youtube" aria-hidden="true"></i>](https://www.youtube.com/watch?v=KmAISyVvE1Y&list=PLIXJ-Sacf8u60G1TwcznBmK6rEL3gmZmV&index=2)(23 minutes): Explains, with the help of illustrations, the matrix operations to calculate self-attention, then moves on to keys, queries, and values. With the basic concepts in place, it explains why we need multi-head attention.
- [Lecture 12.2 Transformers <i class="fab fa-youtube" aria-hidden="true"></i>](https://www.youtube.com/watch?v=oUhGZMCTHtI&list=PLIXJ-Sacf8u60G1TwcznBmK6rEL3gmZmV&index=3)(18 minutes): Examines the pieces that make up the transformer model in the paper. The pictures from the paper are dissected with some math and code.

## Hour 4 - Pick your adventure

- Go wide with [LSTM is dead, long live Transformers  <i class="fab fa-youtube" aria-hidden="true"></i>](https://sea-adl.org/2019/12/03/lstm-is-dead-long-live-transformers/) (30 minutes): This talk gives a sense of history, explaining how we approached natural language problems in the past, their limitations, and how transformers overcame those limitations. It shows how to implement the transformer calculations with Python code. If you are better at visualizing code than math (like me), this can help you understand the operations.
- Go deep with [The Annotated Transformer](http://nlp.seas.harvard.edu/annotated-transformer/) (30 to 60 minutes to read, hours and hours to experiment):  This article by the Harvard NLP team annotates the transformer paper with modern (as of 2022) PyTorch code. Each section of the paper is supplemented by the code that implements it. Part 3, "A Real World Example", implements a fully functional German-English translation example using a [smaller dataset](https://torchtext.readthedocs.io/en/latest/datasets.html#multi30k) that makes it workable on smaller machines.

## Where to go from here

It is a good time to reread the paper. It will make more sense now.

These are other articles and videos that helped me understand transformers. Some of them overlap with the ones above, and some are complementary.

- Positional embedding (encoding) is a key concept in understanding transformers. The transformer paper assumes that the reader knows that concept and briefly explains the reasons to use sine and cosine. [This video  <i class="fab fa-youtube" aria-hidden="true"></i>](https://www.youtube.com/watch?v=1biZfFLPRSY) from _AI Coffee Break with Letitia_ explains in under ten minutes the concepts and the reasons to use sine and cosine.
- [Transformers from scratch](http://peterbloem.nl/blog/transformers) is the accompanying blog post to hour 3, "Digging into details." Professor Bloem describes some concepts explored in the video and adds code to show they are implemented.
- [Transformers from Scratch](https://e2eml.school/transformers.html) (same title, different article) takes more time than other articles to explain one-hot encoding, dot product, and matrix multiplication, among others, with illustrations. By the time it gets to "attention as matrix multiplication", it's easier to understand the math. This post can be a good refresher if you are rusty on the math side of machine learning.
- [Transformer model for language understanding](https://www.tensorflow.org/text/tutorials/transformer) is TensorFlow's official implementation of the paper. It is not as annotated as the PyTorch code in [The Annotated Transformer](http://nlp.seas.harvard.edu/annotated-transformer/), but still helpful if you are in a TensorFlow shop.
- [The Transformer Model in Equations](https://johnthickstun.com/docs/transformers.pdf) is exactly what the name says, transformers as mathematical operations. The "Discussion" section is an insightful explanation of the equations, valuable even if you don't have a strong math background (like me).
- [The Illustrated Transformer](https://jalammar.github.io/illustrated-transformer/) is an often-cited source for understanding transformers. It is a good source if someone has time to read only one article beyond the paper.

For a sense of history, these are two papers highly cited as works that led us to the transformer architecture.

- [Neural Machine Translation by Jointly Learning to Align and Translate](https://arxiv.org/abs/1409.0473) is the paper credited with introducing the "attention" mechanism.
- [Effective Approaches to Attention-based Neural Machine Translation](https://arxiv.org/abs/1508.04025) builds on the previous paper, introducing other important concepts, including dot-product attention. This [official Tensorflow notebook](https://www.tensorflow.org/text/tutorials/nmt_with_attention) implements a Spanish-to-English translation based on the paper.

Finally, [Attention is all you need; Attentional Neural Network Models <i class="fab fa-youtube" aria-hidden="true"></i>](https://www.youtube.com/watch?v=rBCqOTEfxvg) is a talk by Łukasz Kaiser, one of the [paper's](https://arxiv.org/abs/1706.03762) authors. He builds up the solution, starting with how natural language translation used to be solved in the past, the limitations, and how transformers solve them. So far, it's what I would expect from one of the authors. What makes this video interesting to me is how humble Łukasz is. He explains the trials and errors and, at one point, how they had to ask for help to train the model they created.

Reading a scientific paper makes it look like a linear story from problem to solution ("we had an idea and implemented it"). Watching Łukasz talk helps understand how these great solutions don't arrive out of thin air. Researchers build on top of previous work, try many variations, make mistakes, and ask for help to complete their work. Then they write the paper…
