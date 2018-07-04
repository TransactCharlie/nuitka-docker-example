FROM transactcharlie/docker-nuitka:latest as builder

MAINTAINER Charlie Gildawie <charles.gildawie@gmail.com>
LABEL org.label-schema.name="Docker Nuitka Build Base" \
      org.label-schema.vcs-url="https://github.com/TransactCharlie/docker-nuitka" \
      org.label-schema.description="Docker Image premade with Python3, docker.io and nuitka compiler"

COPY . /
RUN mv -v examples/hello_world /app
RUN pip3 install -r app/requirements.txt
RUN nuitka3 --standalone --show-progress --python-flag=no_site app/app.py
RUN build_scripts/ldd_cp.sh "app.dist/app.exe" "app.dist"
RUN ls -lhR app.dist

FROM scratch
LABEL org.label-schema.name="Hello World Example" \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://github.com/TransactCharlie/nuitka-docker-example" \
      org.label-schema.description="Full example App compiled with nuitka in a scratch docker container"
COPY --from=builder /app.dist/ /
CMD ["/app.exe"]
