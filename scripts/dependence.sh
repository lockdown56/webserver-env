#!/bin/bash
# 安装依赖

# 检测并安装指定依赖
checkAndInstall(){
  pkg=$1
  dpkg --get-selections | grep "\<$pkg\>" | grep "\<install\>"
  if [ $? -ne 0 ]
  then
    sudo apt-get install -y $pkg
  fi
}

# 定义依赖库数组, for ubuntu
# libs_arr="gcc gcc-c++ automake libtool make cmake zlib1g zlib.dev"
libs_arr=()
libs_arr+=(build-essential)
libs_arr+=(gcc gcc-c++ libtool automake make cmake autoconf)
libs_arr+=(zlib1g zlib1g.dev openssl libssl-dev)
libs_arr+=(libpcre3 libpcre3-dev)
libs_arr+=(sysv-rc-conf)
libs_arr+=(libxml2 libxml2-dev php5-openssl libcurl4-openssl-dev pkg-config)
libs_arr+=(libjpeg-dev libpng12-dev libfreetype6-dev libmcrypt-dev libmcrypt4)

# on centos is ncurses-devel
libs_arr+=(libncurses5-dev gnutls-bin)

# 遍历安装依赖
for lib in ${libs_arr[@]}
do
  checkAndInstall $lib
done

exit 0