#!/usr/bin/env bash

# use to regen all completions

set -e

mise completions bash > ../dot_bash_completions/mise.bash
just --completions bash > ../dot_bash_completions/just.bash