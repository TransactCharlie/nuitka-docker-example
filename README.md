[![Build Status](https://travis-ci.org/TransactCharlie/nuitka-docker-example.svg?branch=master)](https://travis-ci.org/TransactCharlie/nuitka-docker-example)
[![](https://images.microbadger.com/badges/image/transactcharlie/nuitka-docker-example.svg)](https://microbadger.com/images/transactcharlie/nuitka-docker-example "Get your own image badge on microbadger.com")
[![](https://images.microbadger.com/badges/version/transactcharlie/nuitka-docker-example.svg)](https://microbadger.com/images/transactcharlie/nuitka-docker-example "Get your own version badge on microbadger.com")


# nuitka-docker-example
minimal docker image (from scratch) containing just a compiled python program and its dependent libs

the python program in `app` will be compiled (expecting an entrypoint of `app.py`) by [nuitka](http://nuitka.net/) and then a docker image will be created containing **nothing but** the compiled python app, its lib dependencies and the ld linker.

I'm not sure how ***usefull*** this is but it is, at least, **interesting**

## Getting your hands on the image
`docker run transactcharlie/nuitka-docker-example` should run and show you the value `It Worked!`
