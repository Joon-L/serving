# Knative Serving
HACK RELEASE THIS UGLY UGLY FORK:
1. get docker secretes to viennadroptest
1. ./hack/release.sh --skip-tests --release-acr viennadroptest --release-azblob https://knrelease.blob.core.windows.net/joon --publish
1. Then copy serving.yaml
1. Then replace the image names with the XTAG from release.sh in vendor (ugh)

[![GoDoc](https://godoc.org/github.com/knative/serving?status.svg)](https://godoc.org/github.com/knative/serving)
[![Go Report Card](https://goreportcard.com/badge/knative/serving)](https://goreportcard.com/report/knative/serving)
[![Releases](https://img.shields.io/github/release-pre/knative/serving.svg)](https://github.com/knative/serving/releases)
[![LICENSE](https://img.shields.io/github/license/knative/serving.svg)](https://github.com/knative/serving/blob/master/LICENSE)

Knative Serving builds on Kubernetes and Istio to support deploying and serving
of serverless applications and functions. Serving is easy to get started with
and scales to support advanced scenarios.

The Knative Serving project provides middleware primitives that enable:

- Rapid deployment of serverless containers
- Automatic scaling up and down to zero
- Routing and network programming for Istio components
- Point-in-time snapshots of deployed code and configurations

For documentation on using Knative Serving, see the
[serving section](https://www.knative.dev/docs/serving/) of the
[Knative documentation site](https://www.knative.dev/docs).

For documentation on the Knative Serving specification, see the
[docs](https://github.com/knative/serving/tree/master/docs) folder of this
repository.

If you are interested in contributing, see [CONTRIBUTING.md](./CONTRIBUTING.md)
and [DEVELOPMENT.md](./DEVELOPMENT.md).
