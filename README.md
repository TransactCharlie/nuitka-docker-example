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

[![It Works Build Status](https://travis-ci.org/TransactCharlie/nuitka-docker-example.svg?branch=master)](https://travis-ci.org/TransactCharlie/nuitka-docker-example)

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
# docker run transactcharlie/nuitka-docker-example:latest
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

[![It Works Build Status](https://travis-ci.org/TransactCharlie/nuitka-docker-example.svg?branch=waitress)](https://travis-ci.org/TransactCharlie/nuitka-docker-example)

This is a **much** more involved example that uses the popular python microframework [Flask](http://flask.pocoo.org/) being served by [Waitress](http://docs.pylonsproject.org/projects/waitress/en/latest/) - a pure python WSGI server.

Again, my code doesn't do much except say "Hello World" but it illustrates more of a `real world` example.

the app.py is again very simple:

```python
from flask import Flask
from waitress import serve
import logging

FORMAT = '%(asctime)-15s %(levelname)s:%(message)s'
logging.basicConfig(format=FORMAT, datefmt='%Y-%m-%dT%I:%M:%S', level=logging.INFO)
log = logging.getLogger(__name__)
app = Flask(__name__)


@app.route("/")
def hello():
    log.info("Hello World!")
    return "Hello World!"


if __name__ == "__main__":
    serve(app, host="0.0.0.0", port="8001")

```

You can run this with (running as a demon and exposing port 8001 to your host):

```bash
docker run -d -p 8001:8001 transactcharlie/nuitka-docker-example:waitress
```

You should see output such as:
```
# docker run -d -p 8001:8001 transactcharlie/nuitka-docker-example:waitress
Unable to find image 'transactcharlie/nuitka-docker-example:waitress' locally
waitress: Pulling from transactcharlie/nuitka-docker-example
f33fa6db8ef2: Already exists
Digest: sha256:2df534f950c29a95a375f4335034715a103bf65b6be5f32e7c7cd606497dbff9
Status: Downloaded newer image for transactcharlie/nuitka-docker-example:waitress
e40078973f50285606a9b17fa86519489daeac77542c5607d55f27a39ce1ad22
```

And now you **should** be able to access the http endpoint `http://localhost/` and see a nice `Hello World!` message

```
# curl http://localhost:8001/
Hello World!

# docker logs e40
2016-10-13T06:26:21 INFO:Hello World!
```
