#! /usr/bin/env bash

source vendor/knative.dev/test-infra/scripts/release.sh

PUBLISH_YAML=serving.yaml

function build_release() {
  # config/ contains the manifests
  ko resolve ${KO_FLAGS} -f config/ > ${PUBLISH_YAML}
  ARTIFACTS_TO_PUBLISH=${PUBLISH_YAML}
}

main $@

