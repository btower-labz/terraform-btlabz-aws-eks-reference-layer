#!/usr/bin/env bash

set -o nounset
set -o noclobber
set -o errexit
set -o pipefail

export KUBECONFIG=.kube/config
export AWS_PROFILE=terraform-infra

export DASHBOARD_VERSION="v2.0.4"

docker run -ti --rm \
-e HOME=${HOME} \
-e AWS_PROFILE=${AWS_PROFILE} \
-v "${HOME}:${HOME}/" \
-v /etc/group:/etc/group:ro \
-v /etc/passwd:/etc/passwd:ro \
-u $(id -u ${USER}):$(id -g ${USER}) \
-w $(pwd) \
amazon/aws-cli:latest sts get-caller-identity

docker run -ti --rm \
-e HOME=${HOME} \
-e AWS_PROFILE=${AWS_PROFILE} \
-v "${HOME}:${HOME}/" \
-v /etc/group:/etc/group:ro \
-v /etc/passwd:/etc/passwd:ro \
-u $(id -u ${USER}):$(id -g ${USER}) \
-w $(pwd) \
amazon/aws-cli:latest eks get-token --cluster-name blackbox --region me-south-1
