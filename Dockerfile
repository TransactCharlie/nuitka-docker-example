FROM scratch
COPY app.dist/* /
ENTRYPOINT ["/app.exe"]
