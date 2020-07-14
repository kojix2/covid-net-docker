# COVIDNet-CXR4-A
FROM python:3.8-slim as COVIDNet-CXR4-A
WORKDIR /download
RUN pip3 install gdown && \
    gdown https://drive.google.com/uc?id=1dCU5NV_-DKMKPUIJxO2MFU603LFkx5bd && \
    gdown https://drive.google.com/uc?id=1cQ6Z3esdyTDuZJqc8lu8tL0sJ6GZCosI && \
    gdown https://drive.google.com/uc?id=1-GW2qlGYcpNLgjy-q_f2XNYSlMzAbC8F && \
    gdown https://drive.google.com/uc?id=1zGS8sA4HB6cnWfRlL8g18QJi_4tq6hNF

# COVIDNet-SEV-GEO
FROM python:3.8-slim as COVIDNet-SEV-GEO
WORKDIR /download
RUN pip3 install gdown && \
    gdown https://drive.google.com/uc?id=1vmr5gADYVokAYz-6kGQ-INb_r0weoWWD && \
    gdown https://drive.google.com/uc?id=18zSwSRybX2Zy5jm0E4alBuGGvHAuuvXd && \
    gdown https://drive.google.com/uc?id=10aL3s_TLRSCxZ0E2OUIjy9rLa-fTOtUj && \
    gdown https://drive.google.com/uc?id=1Sbp4NetlGzEM0VwxkZ1Lq-0fjprdjdCR

# COVIDNet-SEV-OPC
FROM python:3.8-slim as COVIDNet-SEV-OPC
WORKDIR /download
RUN pip3 install gdown && \
    gdown https://drive.google.com/uc?id=11Ju0YeIitzS2GgXJ4U5J3M87tF683-sM && \
    gdown https://drive.google.com/uc?id=1m0dXmUueCx4v9PbZhanmbt0ECe63tMKA && \
    gdown https://drive.google.com/uc?id=1oaILEyuMcHWQS68l4hrMPyWgosnqfAu0 && \
    gdown https://drive.google.com/uc?id=1m5eJwhuFccZwyGl8T4DRfq8x3rgkqCEC

# COVID-Net.git
FROM debian:buster-slim as fetch-repo
RUN apt update && apt install -y git
RUN git clone --depth 1 https://github.com/lindawangg/COVID-Net.git /COVID-Net

# Main
FROM tensorflow/tensorflow:1.15.2-py3
LABEL maintainer="kojix2 <2xijok@gmail.com>"
RUN set -x && \
    apt update -y && \
    apt install -y libsm6 libxrender1 libxext-dev && \
    pip3 install --upgrade pip && \
    pip3 install scikit-learn && \
    pip3 install matplotlib && \
    pip3 install opencv-python

COPY --from=fetch-repo /COVID-Net /COVID-Net

WORKDIR /COVID-Net/models/COVIDNet-CXR4-A
COPY --from=COVIDNet-CXR4-A /download .
WORKDIR /COVID-Net/models/COVIDNet-SEV-GEO
COPY --from=COVIDNet-SEV-GEO /download .
WORKDIR /COVID-Net/models/COVIDNet-SEV-OPC
COPY --from=COVIDNet-SEV-OPC /download .

WORKDIR /COVID-Net
