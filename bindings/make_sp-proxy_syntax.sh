#!/usr/bin/env bash

cat template | sed -e "s/%INT%/${1}/" -e "s/%EXT%/${2}/" -e "s/%URL%/${3}/"
