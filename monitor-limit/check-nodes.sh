#!/bin/bash -x

oc login -u admin -p redhat > /dev/null

oc get pod -o wide -n resources

oc describe node node1.lab.example.com | grep -A 4 Allocated

oc describe node node2.lab.example.com | grep -A 4 Allocated

pod=$(oc get pod -n resources -o name | grep -v hello | grep -v build | grep -v deploy)

oc describe pod ${pod} -n resources | grep -A 2 Requests

oc login -u developer -p redhat

