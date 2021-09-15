#!/usr/bin/env bash

for f in scripts/functions/*.sh ; do source "$f" ; done

tf_apply "1-remote-bucket" "global"
tf_apply "2-global-aws-accounts" "global"
