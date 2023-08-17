#!/bin/sh

rm -rf output-tkg-bootstrap-*

packer build \
    --var-file="bootstrap-builder.json" \
    --var-file="bootstrap-versionjson" \
    bootstrap.json
