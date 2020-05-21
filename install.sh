#!/usr/bin/env bash

set -e
set -o pipefail

gist_id=b0d2e7e67aa50298fdf8111ae7466b56
version=0.7

tmp_dir=$(mktemp -d)
trap 'rm -r $tmp_dir' EXIT

cd $tmp_dir
curl -o $gist_id.tar.gz https://codeload.github.com/gist/$gist_id/tar.gz/v$version
tar -zxvf $gist_id.tar.gz > /dev/null

sudo install -m755 $gist_id-$version/gist /usr/local/bin/gist
