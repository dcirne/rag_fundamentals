FROM python:3.11-bookworm

# Set bash as shell
SHELL ["/bin/bash", "-c"]

# Create the deployment and other directories
RUN mkdir -p /workspace

# Working directory
WORKDIR /workspace

# Update system and install required dependencies
RUN apt-get update && \
    apt-get -y upgrade

# Copy necessary files
COPY requirements.txt /workspace/

# Install packages and tools
RUN set -eux && \
    apt-get install -y --no-install-recommends \
        build-essential && \
    pip install --upgrade pip

RUN pip install --no-cache-dir -r requirements.txt

# Exposes connection port
EXPOSE 8024

# Run the Jupyter Notebook
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8024", "--no-browser", "--allow-root"]