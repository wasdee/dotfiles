#!/usr/bin/env bash

# use to regen all completions

set -e

rtx completions bash > ../dot_bash_completions/rtx.bash
just --completions bash > ../dot_bash_completions/just.bash