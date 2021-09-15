#!/usr/bin/env bash

tf_apply() {
    dir=$1
    stage=$2

    test -z ${dir:-} && { echo -e "Missing required 1st parameter \"dir\"" ; exit 1 ; }
    test -z ${stage:-} && { echo -e "Missing required 2nd parameter \"stage\"" ; exit 1 ; }

    tf_path="$(pwd)/src/terraform/${dir}"
    vars_path="$(pwd)/cnf/env/${stage}/${dir}-vars.tfvars"
    backend_config_path="$(pwd)/cnf/env/${stage}/${dir}-backend-config.tfvars"

    test -f $backend_config_path || {
        terraform -chdir=$tf_path init
    }

    test -f $backend_config_path && {
        terraform -chdir=$tf_path init -backend-config=$backend_config_path
    }

    terraform -chdir=$tf_path apply -var-file=$vars_path -auto-approve
}
