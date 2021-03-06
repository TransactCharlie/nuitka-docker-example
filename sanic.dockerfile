FROM transactcharlie/docker-nuitka:latest AS builder
MAINTAINER Charlie Gildawie <charles.gildawie@gmail.com>
LABEL org.label-schema.name="Sanic Example" \
      org.label-schema.vcs-url="https://github.com/TransactCharlie/nuitka-docker-example" \
      org.label-schema.description="Full example App compiled with nuitka in a scratch docker container"
COPY examples/sanic /app
COPY build_scripts /build_scripts
RUN pip3 install -r app/requirements.txt
RUN nuitka3 --standalone --show-progress --python-flag=no_site app/app.py
RUN build_scripts/ldd_cp.sh "app.dist/app.exe" "app.dist"
RUN ls -lhR app.dist

FROM scratch
MAINTAINER Charlie Gildawie <charles.gildawie@gmail.com>
LABEL org.label-schema.name="Sanic Example" \
      org.label-schema.vcs-url="https://github.com/TransactCharlie/nuitka-docker-example" \
      org.label-schema.description="Full example App compiled with nuitka in a scratch docker container"
COPY --from=builder /app.dist/ /
CMD ["/app.exe"]
