# Preso Presentation
A simple presentation app based on Go-based [Present](https://godoc.org/golang.org/x/tools/cmd/present) tool. The Present file format is documented [here](https://godoc.org/github.com/Go-zh/tools/present).

## Build & Push

* To update base Preso look and feel and slide templates, re-build the [preso-base](https://github.com/rupakg/preso-base) image by: 

```
$ cd preso-base
$ ./build.sh
$ ./push.sh
```
* To add or update slides, articles or resources, stop and re-run:

```
$ docker-compose up --build
```

To tail logs run:

```
$ docker-compose logs -f
```

When development is complete, build the [preso-slides](https://github.com/rupakg/preso-slides) image by:

```
$ cd preso-slides
$ ./build.sh
$ ./push.sh
```


## Run

Setup Basic Auth for Nginx:

```
$ cd ../preso-auth
$ htpasswd -db .htpasswd preso_user P@ssw0rd!
```

Run the app by:

```
$ cd preso-app
$ docker-compose up -d
```

Point your browser to: `http://localhost:8080`

Auth: preso_user/P@ssw0rd!

## Scale

To scale up the app run:

```
$ docker-compose up -d --scale preso-slides=3
```

## Cleanup

```
$ cd preso-app
$ docker-compose kill 
```
