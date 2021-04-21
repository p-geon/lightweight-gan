FROM pytorch/pytorch:1.7.1-cuda11.0-cudnn8-runtime
LABEL purpose="pytorch-gpu-notebook"
LABEL version="0.1"

ENV DEBCONF_NOWARNINGS yes

COPY ./requirements.txt ./
RUN apt-get update && apt-get install -y --quiet --no-install-recommends \
    graphviz \
    wget \
    gcc

RUN pip install -q --upgrade pip
RUN pip install -r requirements.txt -q
RUN pip install lightweight-gan

WORKDIR /work
CMD ["/bin/bash"]