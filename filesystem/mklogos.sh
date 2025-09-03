#!/bin/sh
set -e

baseurl=https://gitea.artixlinux.org/artix/artwork/raw/branch/master/icons/

mklogo() (
  name="$1"
  remote="$2"

  rm -f -- "$remote" "$name.svg.tmp" "$name.svg" "$name.png"
  wget -O "$remote" -- "$baseurl/$remote"
  rsvg-convert -f svg -w 256 -o "$name.svg.tmp" -- "$remote"
  scour --strip-xml-prolog --remove-descriptive-elements \
      --enable-comment-stripping --enable-viewboxing \
      --enable-id-stripping --shorten-ids \
      -i "$name.svg.tmp" -o "$name.svg"
  rm -- "$remote" "$name.svg.tmp"
)

mklogo artixlinux-logo           artixlinux-logo-only.svg           &
mklogo artixlinux-logo-text      artixlinux-logo-dark-scalable.svg  &
mklogo artixlinux-logo-text-dark artixlinux-logo-light-scalable.svg &

wait

rsvg-convert -f png -z 1 -o artixlinux-logo.png artixlinux-logo.svg
optipng -strip all -o4 -fix -- artixlinux-logo.png
