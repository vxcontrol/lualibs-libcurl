cp -f curl_config.h.$P lib/curl_config.h
C="$C -DHAVE_CONFIG_H -DUSE_OPENSSL vtls/openssl.c vtls/keylog.c hostcheck.c x509asn1.c" \
L="$L -s -static-libgcc -lrt ../../../bin/$P/libssl.a ../../../bin/$P/libcrypto.a ../../../bin/$P/libz.a" \
D=libcurl.so A=libcurl.a ./build.sh
