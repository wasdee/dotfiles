#!/usr/bin/env bash

# use to regen all completions

set -e

rtx completions bash > ./rtx.bash
just --completions bash > ./just.bash