#!/usr/bin/env bash
# Builds the Party Client mod for one Minecraft version and copies it into the launcher.
# Usage: ./build-client.sh            (uses client/gradle.properties)
set -e
cd client
gradle build            # or ./gradlew build if you ran `gradle wrapper`
cp build/libs/partyclient-*+mc*.jar ../launcher/bundled/
echo "Copied to launcher/bundled/"
