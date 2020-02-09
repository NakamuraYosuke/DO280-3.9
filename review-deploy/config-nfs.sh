#!/bin/bash

export_dir="/var/export/dbvol"
export_file="/etc/exports.d/dbcol.exports"
master_hostname="services"

  if [[ $(hostname -s) != ${master_hostname} && ${UID} -ne "0" ]]; then
    echo "This script must be run on the ${master_hostname} host as root."
    exit 1
  fi

  if [ -d ${export_dir} ]; then
    echo "Export directory ${export_dir} already exists."
  else
    mkdir -p ${export_dir}
    chown nfsnobody:nfsnobody /var/export/dbvol
    chmod 700 /var/export/dbvol
    echo "Export directory ${expoert_dir} created."
  fi

  if [ -f ${expoert_file} ]; then
    echo "Expoert file ${export_file} already exists."
  else
    echo "/var/export/dbvol *(rw,async,all_squash)" > /etc/exports.d/dbvol.exports
    exportfs -a
    showmount -e
  fi

