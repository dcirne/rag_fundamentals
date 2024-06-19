# RAG Fundamentals and Semantic Chunking

The material in this repository was initially prepared for a lecture I gave at [The 2024 IARIA Annual Congress on Frontiers in Science, Technology, Services, and Applications](https://www.iaria.org/conferences2024/ProgramIARIACongress24.html), on the topics of Retrieval-Augmented Generation (RAG) and Semantic Chunking.

RAG is a technique used to optimize the output of a Large Language Model (LLM). The expectation is that [In-Context Learning](https://arxiv.org/abs/2212.10559) (ICL) takes place, leading the LLM to produce better results.

RAG can be more effective when semantic chunking is used. The basic idea is to retrieve and compile small "chunks" of data to augment the prompt to be sent to an LLM, rather than inserting entire documents that contain the topic of interest, but also information that is not relevant to the user interaction. For example, imagine a book about how to assemble a computer. It contains sections about CPUs, mother boards, displays, and so on. Now suppose you have a question on how to install a hard drive. Would you read the section about keyboards, or would you go straight to the hard drives one?

The same idea is applicable to LLMs. In addition, the context window<sup>‡</sup> is limited, so use the available space wisely.

One challenges that emerges from semantic chunking is determining the optimal chunk size. Too much or too little information would produce embeddings that would either try to encode too many meanings, or not be able to express enough meaning.

Context for RAG and semantic chunking comes from the paper "[Fostering Trust and Quantifying Value of AI and ML](https://www.iaria.org/conferences2024/ProgramIARIACongress24.html)," which I am an author and presented at the same conference. The pdf was converted to plain text using [pdftotext](https://poppler.freedesktop.org).

.........

‡ <sup><sub>The number of tokens a model can receive as input. Its capacity influences how much information can be leveraged to run inferences.</sub></sup> 

### Doing it yourself

This repository contains all the files you need to experiment with RAG and semantic chunking. Everything is siloed in a Docker image, this way you can run the code without messing up with any configuration on your computer.

There are a few prerequisites and assumptions:

- You have either [Docker](https://www.docker.com) or [Podman](https://podman.io) configured, installed, and running
- You have a developer account with [OpenAI](https://openai.com) and an [API Key](https://platform.openai.com/docs/quickstart/step-2-set-up-your-api-key) for you project
    - Make sure you have access to the `text-embedding-3-small` and `gpt-3.5-turbo` models

Now that you're ready, follow these steps to access and run the code:

#### Build the Docker image

```bash
docker build -f Dockerfile -t rag_fundamentals --rm .
```

#### Export the OpenAI API Key to an environment variable

```bash
export OPENAI_API_KEY="your-openai-api-key"
```

#### Run the Docker image

The Docker container will use your local directory with this project and mount it in a shared volume inside of the container.

```bash
docker run --rm -p 8024:8024 -e OPENAI_API_KEY=$OPENAI_API_KEY -v $(pwd):/workspace rag_fundamentals
```

#### Access the Jupyter Notebook

The [Jupyter Server](https://jupyter.org) requires an authentication token for access. Once the container is running, you will see a log message on the terminal similar to the one shown below. Copy it and paste it to a browser.

```bash
http://127.0.0.1:8024/tree?token=5f0ccbf63ee6dc8151240fae2828d94e3ebf21d892cd6822
```

After you are able to access the Jupyter Server, double click on `rag_fundamentals.ipynb` to launch it. Follow the documentation and instruction in the notebook.