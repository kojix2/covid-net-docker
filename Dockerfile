FROM tensorflow/tensorflow:1.15.2-py3
LABEL maintainer="kojix2 <2xijok@gmail.com>"
RUN set -x && \
    apt update -y && \
    apt install -y wget unzip libsm6 libxrender1 libxext-dev && \
    pip3 install --upgrade pip && \
    pip3 install scikit-learn && \
    pip3 install matplotlib && \
    pip3 install opencv-python && \
    pip3 install gdown
RUN wget https://github.com/lindawangg/COVID-Net/archive/master.zip && \
    unzip master.zip

# Download COVIDNet-CXR4-A 
#          COVIDNet-SEV-GEO
#          COVIDNet-SEV-OPC
RUN mkdir -p /COVID-Net-master/models/COVIDNet-CXR4-A && \
    cd /COVID-Net-master/models/COVIDNet-CXR4-A && \
    gdown https://drive.google.com/uc?id=1dCU5NV_-DKMKPUIJxO2MFU603LFkx5bd && \
    gdown https://drive.google.com/uc?id=1cQ6Z3esdyTDuZJqc8lu8tL0sJ6GZCosI && \
    gdown https://drive.google.com/uc?id=1-GW2qlGYcpNLgjy-q_f2XNYSlMzAbC8F && \
    gdown https://drive.google.com/uc?id=1zGS8sA4HB6cnWfRlL8g18QJi_4tq6hNF && \
    mkdir -p /COVID-Net-master/models/COVIDNet-SEV-GEO && \
    cd /COVID-Net-master/models/COVIDNet-SEV-GEO && \
    gdown https://drive.google.com/uc?id=1vmr5gADYVokAYz-6kGQ-INb_r0weoWWD && \
    gdown https://drive.google.com/uc?id=18zSwSRybX2Zy5jm0E4alBuGGvHAuuvXd && \
    gdown https://drive.google.com/uc?id=10aL3s_TLRSCxZ0E2OUIjy9rLa-fTOtUj && \
    gdown https://drive.google.com/uc?id=1Sbp4NetlGzEM0VwxkZ1Lq-0fjprdjdCR && \
    mkdir -p /COVID-Net-master/models/COVIDNet-SEV-OPC && \
    cd /COVID-Net-master/models/COVIDNet-SEV-OPC && \
    gdown https://drive.google.com/uc?id=11Ju0YeIitzS2GgXJ4U5J3M87tF683-sM && \
    gdown https://drive.google.com/uc?id=1m0dXmUueCx4v9PbZhanmbt0ECe63tMKA && \
    gdown https://drive.google.com/uc?id=1oaILEyuMcHWQS68l4hrMPyWgosnqfAu0 && \
    gdown https://drive.google.com/uc?id=1m5eJwhuFccZwyGl8T4DRfq8x3rgkqCEC

WORKDIR /COVID-Net-master