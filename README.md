[![Build Status](https://travis-ci.org/TransactCharlie/nuitka-docker-example.svg?branch=master)](https://travis-ci.org/TransactCharlie/nuitka-docker-example)

[![](https://images.microbadger.com/badges/image/transactcharlie/nuitka-docker-example.svg)](https://microbadger.com/images/transactcharlie/nuitka-docker-example "Get your own image badge on microbadger.com")

[![](https://images.microbadger.com/badges/version/transactcharlie/nuitka-docker-example.svg)](https://microbadger.com/images/transactcharlie/nuitka-docker-example "Get your own version badge on microbadger.com")


# nuitka-docker-example
minimal docker image (from scratch) containing just a compiled python program and its dependent libs

the python program in `app` will be compiled (expecting an entrypoint of `app.py`) by [nuitka](http://nuitka.net/) and then a docker image will be created containing **nothing but** the compiled python app, its lib dependencies and the ld linker.

I'm not sure how ***usefull*** this is but it is at least **interesting**

## Builds
I've built a few docker containers as illustrations. One basic ***It Works*** type example and one using ***flask/waitress*** to run a basic webserver.

You can see the status of all builds on [travis-ci](https://travis-ci.org/TransactCharlie/nuitka-docker-example)

### It Works!

The vanilla build is a simple "hello world" type program. The app.py in its entirety is:

```python
if __name__ == "__main__":
    print("It worked!")

```

You can run this with:

```bash
docker run transactcharlie/nuitka-docker-example:latest
```

You should see output such as:
```
$. docker run transactcharlie/nuitka-docker-example:latest
Unable to find image 'transactcharlie/nuitka-docker-example:latest' locally
latest: Pulling from transactcharlie/nuitka-docker-example
334c10c8c5cb: Pulling fs layer
334c10c8c5cb: Verifying Checksum
334c10c8c5cb: Download complete
334c10c8c5cb: Pull complete
Digest: sha256:878649c895775d20a0953dfa3032640be5590f6e116d67c98e8ad83ac9e9f992
Status: Downloaded newer image for transactcharlie/nuitka-docker-example:latest
It worked!
```

Which is a lot of work to print a simple message to the console but...... it was fun!

### Flask App hosted by waitress
