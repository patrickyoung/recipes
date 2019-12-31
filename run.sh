#!/bin/sh

gomplate -d 'person=./data/person.yaml' \
         -f ./templates/helloworld.template