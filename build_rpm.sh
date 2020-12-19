#!/bin/bash - 
#===============================================================================
#
#          FILE: build_rpm.sh
# 
#         USAGE: ./build_rpm.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: m4cr0v@gmail.com
#  ORGANIZATION: 
#       CREATED: 12/19/2020 19:43
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error


curr_dir=`pwd`
parent_dir=`dirname $curr_dir`
base_name=`basename $curr_dir`
package_name=qemu
package_version=2.9.0
package=${package_name}-$package_version
src_dir=/root/rpmbuild/SOURCES
spec_file=qemu-kvm.spec
extra_flags=""

function fail_exit() {
    echo "$*"
    exit 1
}

if [[ "x$base_name" = "x${package}" ]]; then
    echo "No need to rename directory."
else
    echo "Rename $base_name to ${package}"
    cd $parent_dir
    mv $base_name ${package} || fail_exit "Failed to rename directory."
fi

echo "Creating ${package}.tar.gz"
cd $parent_dir && tar -zcf ${package}.tar.gz ${package}

if [[ -d $src_dir ]]; then
    echo "No need to create $src_dir"
else
    echo "Creating $src_dir"
    mkdir -p $src_dir || fail_exit "Failed to create directory."
fi

echo "Copying ${package}.tar.gz"
cp ${package}.tar.gz $src_dir
echo "Copying spec file $spec_file"
cp $parent_dir/${package}/$spec_file $src_dir
echo "Building rpm!"
cd $src_dir && rpmbuild -bb --define "dist .el7" $extra_flags $spec_file
echo "Deleting spec file $spec_file"
rm -f ${src_dir}/$spec_file
echo "Deleting ${package}.tar.gz"
rm -f ${src_dir}/${package}.tar.gz

