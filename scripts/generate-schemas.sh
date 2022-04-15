#!/bin/bash

DIR="crdschemas"

# Go to git repository root
cd ./$(git rev-parse --show-cdup)

rm -rf "$DIR"
mkdir "$DIR"

for crds in vendor/prometheus-operator/*-crds.libsonnet; do
	jq '.spec.versions[0].schema.openAPIV3Schema' < "$crd" > "$DIR/$(basename "$crd" | sed 's/-crds.libsonnet/.json/')"
done
