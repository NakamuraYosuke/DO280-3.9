#!/bin/bash

oc login -u user1 -p redhat
oc project proj-user1
oc create serviceaccount useroot

oc login -u admin -p redhat
oc project proj-user1
oc adm policy add-scc-to-user anyuid -z useroot

oc login -u user2 -p redhat
oc project proj-user1
oc patch dc/nginx --patch \
    '{"spec":{"template":{"spec":{"serviceAccountName": "useroot"}}}}'

sleep 3
oc get pod

