cp -f curl_config.h.$P lib/curl_config.h
[ `uname` = Linux ] && { export X=$A-w64-mingw32-; }
C="$C -D_WIN32_WINNT=0x0501 -DUSE_WINDOWS_SSPI -DUSE_SCHANNEL
	-DUSE_WIN32_IDN -DWANT_IDN_PROTOTYPES idn_win32.c vtls/schannel.c vtls/schannel_verify.c
	vauth/digest.c vauth/digest_sspi.c vauth/gsasl.c vauth/krb5_sspi.c vauth/krb5_gssapi.c
	vauth/ntlm.c vauth/ntlm_sspi.c vauth/spnego_sspi.c vauth/spnego_gssapi.c
	curl_multibyte.c curl_sspi.c http_negotiate.c hostcheck.c inet_ntop.c inet_pton.c
	rtsp.c socks_gssapi.c socks.c socks_sspi.c socketpair.c strtok.c
	system_win32.c version_win32.c x509asn1.c" \
	L="-s -static-libgcc -lws2_32 -lnormaliz -ladvapi32 -lcrypt32 ../../../bin/$P/z.a " \
	D=curl.dll A=curl.a ./build.sh
