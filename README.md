# docker-pdfa-converter

Repo used to have a recipe(Dockerfile) to create a image used by PDFA Converter

## Prerequisites
* Docker - More information [here](http://pt.slideshare.net/vinnyfs89/docker-essa-baleia-vai-te-conquistar?qid=aed7b752-f313-4515-badd-f3bf811c8a35&v=&b=&from_search=1).

## Details

For Each extension installed inside DockerFile, PHP will be compiled again.

## How to build - New image
* Enter inside this cloned repository;
* Execute the commando below to create a new image.
```
docker build -t culturagovbr/pdfa-ocr:1.0 -t culturagovbr/pdfa-ocr_v1:latest .
```

This code `-t culturagovbr/pdfa-ocr:1.0` means you will create a image named 'pdfa-ocr_v1' and tag '1.0' and the `.` means your build will use the same folder.

You can execute the command below to create a new container using this new image created. Note: `$(pwd)` means your current directory. You can also change it, if you want.
```
 docker run -it -v $(pwd)portal-vale-cultura/public:/var/www -v $(pwd)/log/apache2:/var/log/apache2 --name pdfa-ocr_v1v1.0 -e APPLICATION_ENV="development" -p 80:80 -p 9000:9000 -p 8888:8888 culturagovbr/pdfa-ocr_v1:latest
```

For development purposes
```
 docker run -it -v $(pwd)portal-vale-cultura/public:/var/www --name pdfa-ocr_v1v1.0 -e APPLICATION_ENV="development" -p 80:80 culturagovbr/pdfa-ocr_v1:latest
```

Or You you can also execute the same command above, but arranging using docker-compose:
```
@todo fill here
```
## Monitoring Server status
```
docker exec -it pdfa-ocr_v1v1.0 bash -c "cd /tmp && wget 127.0.0.1/server-status -o server-status && cat server-status"
```

## Extra

If you wanna check something inside your container you can access using the command below:
```
docker exec -it pdfa-ocr_v1v1.0 bash
```

See the authors of this repo:
* [Authors](./Authors.md).
