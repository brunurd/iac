#!/usr/bin/env bash

for f in scripts/functions/*.sh ; do source "$f" ; done

tf_apply "3-env-aws-accounts" "dev"
