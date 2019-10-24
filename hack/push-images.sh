#! /usr/bin/env bash

KO_DOCKER_REPO="ko.local"

release_images=()

function tag_images_in_yamls() {
  for file in $@; do
    [[ "${file##*.}" != "yaml" ]] && continue
    echo "Inspecting ${file}"
    for image in $(grep -o "${KO_DOCKER_REPO}/[0-9a-z\./-]*:[0-9a-f]*" ${file}); do
      local dest_image=${ACR_SERVER}/$(echo ${image} | cut -d"/" -f2-)
      echo "Tagging ${dest_image}"
      docker tag ${image} ${dest_image}
      release_images+=(${dest_image})
    done
  done
}

function replace_cr_in_yamls() {
  for file in $@; do
    [[ "${file##*.}" != "yaml" ]] && continue
    echo "Fixing ${file}"
    sed -i "s/${KO_DOCKER_REPO}\/\([0-9a-z\./-]*\):\([0-9a-f]*\)/${ACR_SERVER}\/\1:\2/g" ${file}
  done
}

function do_push() {
  for image in ${release_images[@]}; do
    echo "Pushing ${image}"
    docker push ${image}
  done
}
ACR_SERVER=knative.azurecr.io
#docker login ${ACR_SERVER} -u ${ACR_USER} -p ${ACR_PWD}
tag_images_in_yamls $@
replace_cr_in_yamls $@
do_push

