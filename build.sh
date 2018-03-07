#!/bin/sh
#

echo "AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID}"
echo "AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY//?/*}"
echo "AWS_DEFAULT_REGION=${AWS_DEFAULT_REGION}"

if [[ -z "${AWS_ACCESS_KEY_ID}" ]] || [[ -z "${AWS_SECRET_ACCESS_KEY}" ]] || [[ -z "${AWS_DEFAULT_REGION}" ]]; then
  echo "ERROR: AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY & AWS_DEFAULT_REGION environment variables must all be set"
  exit 2
fi

echo "placebo" | tee target/output
# packer build packer.json
