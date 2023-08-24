#!/bin/sh

rm -rf output-*

packer build \
    --var-file="bootstrap-builder.json" \
    --var-file="bootstrap-version.json" \
    bootstrap.json
