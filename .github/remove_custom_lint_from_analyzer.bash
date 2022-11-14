#!/bin/bash

echo 'Removing custom lint from all analysis_options.yaml files...'

for yaml_file_path in $(find . -name 'analysis_options.yaml' -print); do
  # When in an Apple environment, it only works with the additional ''.
  if [[ "$OSTYPE" == "darwin"* ]]; then
    sed -i '' '/- custom_lint/d' $yaml_file_path
  else
    sed -i '/- custom_lint/d' $yaml_file_path
  fi
done