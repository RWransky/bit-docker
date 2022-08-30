#!/bin/bash

set -x
apt-get update -y

while getopts bit_org:workspace_directory:workspace_template:default_scope:init_workspace:report_analytics:report_errors:no_warnings: flag
do
    case "${flag}" in
        bit_org) BIT_ORG=${OPTARG};;
        workspace_directory) WORKSPACE_DIRECTORY=${OPTARG};;
		workspace_template) WORKSPACE_TEMPLATE=${OPTARG};;
        default_scope) DEFAULT_SCOPE=${OPTARG};;
		init_workspace) INIT_WORKSPACE=${OPTARG};;
		report_analytics) REPORT_ANALYTICS=${OPTARG};;
		report_errors) REPORT_ERRORS=${OPTARG};;
		no_warnings) NO_WARNINGS=${OPTARG};;
    esac
done

echo 'export PATH=$HOME/bin:$PATH' >> ~/.bashrc && source ~/.bashrc

bit config set analytics_reporting $REPORT_ANALYTICS
bit config set error_reporting $REPORT_ERRORS
bit config set no_warnings $NO_WARNINGS

if $INIT_WORKSPACE
then
	echo "initializing workspace: $WORKSPACE_DIRECTORY and scope: $DEFAULT_SCOPE"
	bit new $WORKSPACE_TEMPLATE $WORKSPACE_DIRECTORY --default-scope "${BIT_ORG}.${DEFAULT_SCOPE}"

	cp -r "/tmp/${WORKSPACE_DIRECTORY}" "/${WORKSPACE_DIRECTORY}"

	cd "/${WORKSPACE_DIRECTORY}"
else
	echo 'using preconfigured workspace'

	cd "/${WORKSPACE_DIRECTORY}"
fi

yes | bit init

exec "$@"

exec bash