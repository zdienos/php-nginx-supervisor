# php-nginx-supervisor

Image Docker berbasis `php:<versi>-fpm-alpine` dengan **nginx**, **supervisor**, dan **Composer 2**, dipublikasikan ke GitHub Container Registry.

Ekstensi PHP: `pdo_mysql`, `zip`, `bcmath`, `gd` (freetype, jpeg, webp, xpm), `intl`, `pcntl`, `redis`.

## Build

```bash
./build.sh <versi-php> <tag> [--push]
# contoh:
./build.sh 8.4 1.0 --push   # -> ghcr.io/zdienos/php84-nginx-supervisor:1.0 (+ :latest)
```

Script akan build image, menjalankan cek singkat (versi PHP, Composer, ekstensi), lalu push jika `--push` diberikan.

## Pakai

```bash
docker pull ghcr.io/zdienos/php84-nginx-supervisor:latest
```
