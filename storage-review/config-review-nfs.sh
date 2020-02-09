#!/bin/bash

export_dir="/var/export/review-dbvol"
export_file="/etc/export.d/review-dbvol.exports"
services_hostname="services"

  if [[ $(hostname -s) != ${services_hostname} && ${UID} -ne "0" ]]; then
    echo "This script must be run on the ${services_hostname} host as root."
    exit 1
  fi

  if [ -d ${export_dir} ]; then
    echo "Export directory ${export_dir} already exists."
  else
    mkdir -p ${export_dir}
    chown nfsnobody:nfsnobody ${export_dir}
    chmod 700 ${export_dir}
    echo "Export directory ${export_dir} created."
  fi

  if [ -f ${export_file} ]; then
    echo "Export file ${export_file} already exists."
  else
    echo "${export_dir} *(rw,async,all_squash)" > ${export_file}
    exportfs -a
  fi

