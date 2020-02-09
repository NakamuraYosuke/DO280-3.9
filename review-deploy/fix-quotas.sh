#!/bin/bash

echo "Changing quotas for the todoapp project..."
oc login -u admin -p redhat https://master.lab.example.com:443 --insecure-skip-tls-verify=true
oc project todoapp
oc patch resourcequota/todoapp-quota --patch '{"spec":{"hard":{"pods":"10"}}}'

