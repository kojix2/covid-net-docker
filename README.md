# covid-net-docker

[COVID-Net](https://github.com/lindawangg/COVID-Net)

## Docker build

```sh
sudo docker build -t covid-net-image .
```

## Docker run

```sh
sudo docker run -it -v $(pwd):/tmp/share covid-net-image bash
```

Then, you will see the message below.

```console
________                               _______________                
___  __/__________________________________  ____/__  /________      __
__  /  _  _ \_  __ \_  ___/  __ \_  ___/_  /_   __  /_  __ \_ | /| / /
_  /   /  __/  / / /(__  )/ /_/ /  /   _  __/   _  / / /_/ /_ |/ |/ / 
/_/    \___//_/ /_//____/ \____//_/    /_/      /_/  \____/____/|__/


WARNING: You are running this container as root, which can cause new files in
mounted volumes to be created as the root user on your host machine.

To avoid this, run the container by specifying your user's userid:

$ docker run -u $(id -u):$(id -g) args...

```

## Inference

```sh
python inference.py \
    --weightspath models/COVIDNet-CXR4-A \
    --metaname model.meta \
    --ckptname model-18540 \
    --imagepath assets/ex-covid.jpeg
```

## Inference Severity

```sh
python inference_severity.py \
    --weightspath_geo models/COVIDNet-SEV-GEO \
    --weightspath_opcmodels/COVIDNet-SEV-OPC \
    --metaname model.meta \
    --ckptname model \
    --imagepath assets/ex-covid.jpeg
```

## Download pre trained models

https://github.com/lindawangg/COVID-Net/blob/master/docs/models.md

