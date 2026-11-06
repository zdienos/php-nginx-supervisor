#!/usr/bin/env bash
# Pemakaian: ./build.sh <versi-php> <tag> [--push]
# Contoh:    ./build.sh 8.4 1.0 --push  ->  ghcr.io/zdienos/php84-nginx-supervisor:1.0
set -euo pipefail

PHP_VERSION="${1:?versi PHP, mis. 8.4}"
TAG="${2:?tag image, mis. 1.0}"
IMAGE="ghcr.io/zdienos/php${PHP_VERSION//./}-nginx-supervisor"

docker build --build-arg PHP_VERSION="$PHP_VERSION" -t "$IMAGE:$TAG" -t "$IMAGE:latest" .
docker run --rm --entrypoint sh "$IMAGE:$TAG" -c 'php -v | head -1; composer --version; php -m | grep -E "gd|intl|redis|zip|pdo_mysql|bcmath|pcntl"'

if [[ "${3:-}" == "--push" ]]; then
  docker push "$IMAGE:$TAG"
  docker push "$IMAGE:latest"
fi
