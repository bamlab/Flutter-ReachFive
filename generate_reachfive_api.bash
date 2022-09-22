#!/bin/bash

openApiCLIVersion="6.0.1"
openApiDartVersion="6.3"

# Downloading yaml
yamlDefinition="reach_five_api.yaml"

# Downloading tools
if test -f "openapi-generator-cli-$openApiCLIVersion.jar"; then
    echo "OpenApi java CLI installed"
else
    echo "Downloading OpenApi java CLI...."
    curl -O "https://repo1.maven.org/maven2/org/openapitools/openapi-generator-cli/$openApiCLIVersion/openapi-generator-cli-$openApiCLIVersion.jar"
    curl -O "https://repo1.maven.org/maven2/com/bluetrainsoftware/maven/openapi-dart-generator/$openApiDartVersion/openapi-dart-generator-$openApiDartVersion.jar"
fi

## Each one of the script arguments should be a swagger base name.
echo "==================================================================";
echo "Building : $yamlDefinition";
echo "==================================================================";
pubName="reach_five_repo"
pubLibrary=$pubName
pubAuthor="CDA"
pubAuthorEmail="matthieup@bam.tech"

# Deleting previous version
rm -rf "$pubName"

# Generting new classes
java -jar "openapi-generator-cli-$openApiCLIVersion.jar" generate \
    -i $yamlDefinition \
    -g dart-dio \
    -o $pubName \
    --additional-properties=pubName=$pubName,
    pubLibrary=$pubLibrary,
    pubAuthor=$pubAuthor,
    pubAuthorEmail=$pubAuthorEmail,
    disallowAdditionalPropertiesIfNotPresent=false,
    serializationLibrary=json_serializable,
    useEnumExtension=true

# Deleting tests
rm -rf "$pubName/test"
rm -rf "$pubName/.gitignore"

## Each one of the script arguments should be a swagger base name.
echo "==================================================================";
echo "Dart build runner"
echo "==================================================================";

cd "$pubName"

# Was causing a race condition
sleep 3

dart run build_runner build --delete-conflicting-outputs

dart pub get
dart fix --apply
dart format .