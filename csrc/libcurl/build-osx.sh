cp -f curl_config.h.$P lib/curl_config.h
[ `uname` = Linux ] && { export X=$A-apple-darwin19-; export CC=clang; }
C="-arch $A $C -DHAVE_CONFIG_H vtls/sectransp.c" \
L="-arch $A ../../../bin/$P/libz.a ../../../bin/$P/libssl.a ../../../bin/$P/libcrypto.a -install_name @rpath/libcurl.dylib -framework CoreFoundation -framework Security" \
D=libcurl.dylib A=libcurl.a ./build.sh
