# nuitka-docker-example
minimal docker image (from scratch) containing just a compiled python program and its dependent libs

the python program in `app` will be compiled (expecting an entrypoint of `app.py`) by [nuitka](http://nuitka.net/) and then a docker image will be created containing **nothing but** the compiled python app, its lib dependencies and the ld linker.

I'm not sure how ***usefull*** this is but it is at least **interesting**

## Hello World
`examples/hello_world` contains a simple python app to test the basic principal

```python
if __name__ == "__main__":
    print("Hello World")
```

You can run this with:

```bash
docker run transactcharlie/nuitka-example:hello-world
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

## Waitress
`examples/waitress` contains a much more involved example using Flask and Waitress to run a web server
The app.py is still quite simple however

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

You can run this with:

```bash
docker run transactcharlie/nuitka-example:waitress
```

You should see output such as:
```
```
