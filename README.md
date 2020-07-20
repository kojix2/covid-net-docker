# covid-net-docker
[![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/kojix2/covid-net?style=flat-square)](https://hub.docker.com/r/kojix2/covid-net/builds)
[![Docker Image Size](https://img.shields.io/docker/image-size/kojix2/covid-net?style=flat-square)](https://hub.docker.com/r/kojix2/covid-net)
[![Docker Image Version (latest by date)](https://img.shields.io/docker/v/kojix2/covid-net?style=flat-square)](https://hub.docker.com/r/kojix2/covid-net/tags)
[![Source Github](https://img.shields.io/badge/source-github-green?style=flat-square)](https://github.com/kojix2/covid-net-docker)

:couple: [COVID-Net](https://github.com/lindawangg/COVID-Net) - An open source project to find COVID-19 from chest x-ray images using deep learning.

:orange: This docker image contains a pre-trained model. There is no need for additional downloads.
 
## Docker pull or build

### pull

```sh
docker pull kojix2/covid-net
```

### Or build it yourself...

```sh
git clone https://github.com/kojix2/covid-net-docker
cd covid-net-docker
sudo docker build -t kojix2/covid-net .
```

## Docker run

Mount the current directory as a volume in Docker so that you can access the chest x-ray images placed in the current directory.

```sh
sudo docker run -it -v $(pwd):/tmp/share kojix2/covid-net bash
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

Or

```sh
python inference.py \
    --weightspath models/COVIDNet-CXR4-A \
    --metaname model.meta \
    --ckptname model-18540 \
    --imagepath /tmp/share/your-chest-image.jpg
```

Result:

`assets/ex-covid.jpeg`

<image src="https://raw.githubusercontent.com/lindawangg/COVID-Net/master/assets/ex-covid.jpeg" alt="ex-covid" width="25%" height="25%"></src>

```
Prediction: COVID-19
Confidence
Normal: 0.031, Pneumonia: 0.189, COVID-19: 0.780
```

## Inference Severity

```sh
python inference_severity.py \
    --weightspath_geo models/COVIDNet-SEV-GEO \
    --weightspath_opc models/COVIDNet-SEV-OPC \
    --metaname model.meta \
    --ckptname model \
    --imagepath assets/ex-covid.jpeg
```

Or

```sh
python inference_severity.py \
    --weightspath_geo models/COVIDNet-SEV-GEO \
    --weightspath_opc models/COVIDNet-SEV-OPC \
    --metaname model.meta \
    --ckptname model \
    --imagepath /tmp/share/your-chest-image.jpg
```

Result:

`assets/ex-covid.jpeg`

<image src="https://raw.githubusercontent.com/lindawangg/COVID-Net/master/assets/ex-covid.jpeg" alt="ex-covid" width="25%" height="25%"></src>

```
Geographic severity: 0.519
Geographic extent score for right + left lung (0 - 8): 4.155
For each lung: 0 = no involvement; 1 = <25%; 2 = 25-50%; 3 = 50-75%; 4 = >75% involvement.
Opacity severity: 0.388
Opacity extent score for right + left lung (0 - 6): 2.329
For each lung: 0 = no opacity; 1 = ground glass opacity; 2 =consolidation; 3 = white-out.
```

## Download pre trained models

https://github.com/lindawangg/COVID-Net/blob/master/docs/models.md

## Want to make covid-net-docker better?

* Report bugs
* Fix bugs and submit pull requests

## Contributors

@sue445, @hareudon, @inductor and ruby-jp slack members.

## Disclaimer

COVID-NET is **not** a production-ready solution.
