C="$C
altsvc.c
asyn-thread.c
base64.c
conncache.c
connect.c
content_encoding.c
cookie.c
curl_addrinfo.c
curl_ctype.c
curl_des.c
curl_endian.c
curl_fnmatch.c
curl_get_line.c
curl_gethostname.c
curl_memrchr.c
curl_ntlm_core.c
curl_ntlm_wb.c
curl_range.c
curl_sasl.c
curl_threads.c
dict.c
doh.c
dotdot.c
dynbuf.c
easy.c
easygetopt.c
easyoptions.c
escape.c
file.c
fileinfo.c
formdata.c
ftp.c
ftplistparser.c
getenv.c
getinfo.c
gopher.c
hash.c
hmac.c
hostasyn.c
hostip.c
hostip6.c
http.c
http2.c
http_aws_sigv4.c
http_chunks.c
http_digest.c
http_ntlm.c
http_proxy.c
if2ip.c
imap.c
llist.c
md4.c
md5.c
mime.c
mprintf.c
mqtt.c
multi.c
netrc.c
nonblock.c
parsedate.c
pingpong.c
pop3.c
progress.c
rand.c
rename.c
select.c
sendf.c
setopt.c
sha256.c
share.c
slist.c
smb.c
smtp.c
socks.c
speedcheck.c
splay.c
strcase.c
strdup.c
strerror.c
strtoofft.c
telnet.c
tftp.c
timeval.c
transfer.c
url.c
urlapi.c
version.c
warnless.c
wildcard.c
vtls/vtls.c
vauth/cleartext.c
vauth/cram.c
vauth/digest.c
vauth/ntlm.c
vauth/oauth2.c
vauth/vauth.c

-I. -I../include -I../../openssl/include
-DHAVE_LIBZ -DHAVE_ZLIB_H -I../../zlib
-DENABLE_IPV6
-DCURL_DISABLE_LDAP
-DCURL_WITH_MULTI_SSL
-DCURL_DISABLE_OPENSSL_AUTO_LOAD_CONFIG
"
cd lib || exit 1
rm -f *.o
mkdir -p ../../../bin/$P
[ "$CC" ] || CC=gcc
${X}${CC} -c -O2 -Wall -fno-strict-aliasing -DBUILDING_LIBCURL $C
${X}${CC} *.o -shared -o ../../../bin/$P/$D $L -L../../../bin/$P
rm -f      ../../../bin/$P/$A
${X}ar rcs ../../../bin/$P/$A *.o
rm *.o
