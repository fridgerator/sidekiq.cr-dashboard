FROM crystallang/crystal:0.25.1 as build
MAINTAINER Nick Franken <shnick@gmail.com>

WORKDIR /app

ADD shard.yml shard.lock dashboard.cr /app/

RUN shards && \
  crystal build dashboard.cr --release --no-debug

FROM scratch

COPY --from=build /lib/x86_64-linux-gnu/libz.so.1 /lib/x86_64-linux-gnu/libz.so.1
COPY --from=build /lib/x86_64-linux-gnu/libz.so.1.2.8 /lib/x86_64-linux-gnu/libz.so.1.2.8
COPY --from=build /lib/x86_64-linux-gnu/libssl.so.1.0.0 /lib/x86_64-linux-gnu/libssl.so.1.0.0
COPY --from=build /lib/x86_64-linux-gnu/libcrypto.so.1.0.0 /lib/x86_64-linux-gnu/libcrypto.so.1.0.0
COPY --from=build /lib/x86_64-linux-gnu/libm.so.6 /lib/x86_64-linux-gnu/libm.so.6
COPY --from=build /lib/x86_64-linux-gnu/libm-2.23.so /lib/x86_64-linux-gnu/libm-2.23.so
COPY --from=build /lib/x86_64-linux-gnu/libpthread.so.0 /lib/x86_64-linux-gnu/libpthread.so.0
COPY --from=build /lib/x86_64-linux-gnu/libpthread-2.23.so /lib/x86_64-linux-gnu/libpthread-2.23.so
COPY --from=build /lib/x86_64-linux-gnu/librt.so.1 /lib/x86_64-linux-gnu/librt.so.1
COPY --from=build /lib/x86_64-linux-gnu/librt-2.23.so /lib/x86_64-linux-gnu/librt-2.23.so
COPY --from=build /lib/x86_64-linux-gnu/libdl.so.2 /lib/x86_64-linux-gnu/libdl.so.2
COPY --from=build /lib/x86_64-linux-gnu/libdl-2.23.so /lib/x86_64-linux-gnu/libdl-2.23.so
COPY --from=build /lib/x86_64-linux-gnu/libgcc_s.so.1 /lib/x86_64-linux-gnu/libgcc_s.so.1
COPY --from=build /lib/x86_64-linux-gnu/libc.so.6 /lib/x86_64-linux-gnu/libc.so.6
COPY --from=build /lib/x86_64-linux-gnu/libc-2.23.so /lib/x86_64-linux-gnu/libc-2.23.so
COPY --from=build /lib64/ld-linux-x86-64.so.2 /lib64/ld-linux-x86-64.so.2
COPY --from=build /lib/x86_64-linux-gnu/ld-2.23.so /lib/x86_64-linux-gnu/ld-2.23.so
COPY --from=build /usr/lib/x86_64-linux-gnu/libxml2.so.2 /usr/lib/x86_64-linux-gnu/libxml2.so.2
COPY --from=build /lib/x86_64-linux-gnu/libpcre.so.3 /lib/x86_64-linux-gnu/libpcre.so.3
COPY --from=build /usr/lib/x86_64-linux-gnu/libevent-2.0.so.5 /usr/lib/x86_64-linux-gnu/libevent-2.0.so.5
COPY --from=build /usr/lib/x86_64-linux-gnu/libicuuc.so.55 /usr/lib/x86_64-linux-gnu/libicuuc.so.55
COPY --from=build /lib/x86_64-linux-gnu/liblzma.so.5 /lib/x86_64-linux-gnu/liblzma.so.5
COPY --from=build /usr/lib/x86_64-linux-gnu/libicudata.so.55 /usr/lib/x86_64-linux-gnu/libicudata.so.55
COPY --from=build /usr/lib/x86_64-linux-gnu/libstdc++.so.6 /usr/lib/x86_64-linux-gnu/libstdc++.so.6
COPY --from=build /usr/lib/x86_64-linux-gnu/libyaml-0.so.2 /usr/lib/x86_64-linux-gnu/libyaml-0.so.2
COPY --from=build /lib/x86_64-linux-gnu/libnss_dns.so.2 /lib/x86_64-linux-gnu/libnss_dns.so.2
COPY --from=build /lib/x86_64-linux-gnu/libresolv.so.2 /lib/x86_64-linux-gnu/libresolv.so.2
COPY --from=build /app/dashboard /dashboard

EXPOSE 3000

CMD ["/dashboard"]
