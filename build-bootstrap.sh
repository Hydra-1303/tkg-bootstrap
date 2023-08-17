#!/bin/sh

rm -rf output-tkg-bootstrap-*

packer build \
    --var-file="bootstrap-builder.json" \
    --var-file="bootstrap-version-11.6.0.json" \
    bootstrap.json
