#! /bin/bash
if [[ "${1}" != @(arm|amd) ]]; then exit; fi
apt-get update &&
    apt-get install -y g++ &&
    apt-get clean &&
    rm -rf /var/lib/apt/lists/*

if [[ "${1}" == "arm" ]]; then
    path="Arm_BCM2711_10.2.0_32bit"
else
    path="x64"
fi
cd /tmp/tutk/${path}
g++ -fPIC -shared -Wl,--whole-archive,--verbose \
libAVAPIs.a \
libcrypto_tutk.a \
libcurl_tutk.a \
libIOTCAPIs.a \
libjson-c_tutk.a \
libssl_tutk.a \
libTUTKGlobalAPIs.a \
libNebulaAPIs.a \
libRDTAPIs.a \
-Wl,--no-whole-archive -o /app/${1}.lib
# libAVAPIsT.a\
# libIOTCAPIsT.a\
# libTUTKGlobalAPIsT.a\
# libNebulaAPIsT.a\
# libRDTAPIsT.a \
# libP2PTunnelAPIs.a\
# libP2PTunnelAPIsT.a\
