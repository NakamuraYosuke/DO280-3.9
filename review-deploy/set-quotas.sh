#!/bin/bash

echo "Setting quotas on the todoapp project..."
oc project todoapp
oc create quota todoapp-quota --hard=pods=1

