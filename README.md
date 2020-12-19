# 1. Requirements

Run the following command (in CentOS 7) to install the required rpm packages to build qemu-2.9.0:

    yum install zlib-devel glib2-devel which gnutls-devel cyrus-sasl-devel libtool libaio-devel rsync python pciutils-devel libiscsi-devel ncurses-devel libattr-devel libusbx-devel >= 1.0.19 usbredir-devel >= 0.7.1 texinfo spice-protocol >= 0.12.12 spice-server-devel >= 0.12.8 libcacard-devel nss-devel libseccomp-devel >= 2.3.0 libcurl-devel libssh2-devel librados2-devel librbd1-devel glusterfs-api-devel >= 3.6.0 glusterfs-devel systemtap systemtap-sdt-devel libjpeg-devel libpng-devel libuuid-devel bluez-libs-devel brlapi-devel check-devel libcap-devel pixman-devel perl-podlators texinfo rdma-core-devel gperftools-devel libfdt-devel >= 1.4.3 iasl cpp lzo-devel snappy-devel numactl-devel libgcrypt-devel binutils kernel-devel diffutils


# 2. Build

Run the following command to build rpm packages:

    sh build_rpm.sh 

# 3. More information

For more information, please read the [official README](README) or the [official repository](https://github.com/qemu/qemu) of qemu.


