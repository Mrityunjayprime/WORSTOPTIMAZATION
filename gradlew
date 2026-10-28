#!/usr/bin/env sh
set -eu
ROOT="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"
GRADLE_VERSION="9.4.0"
if command -v gradle >/dev/null 2>&1; then
  exec gradle -p "$ROOT" "$@"
fi
CACHE="${GRADLE_USER_HOME:-$HOME/.gradle}/worstoptimazation-bootstrap/gradle-$GRADLE_VERSION"
if [ ! -x "$CACHE/bin/gradle" ]; then
  mkdir -p "$(dirname "$CACHE")"
  ARCHIVE="$(dirname "$CACHE")/gradle-$GRADLE_VERSION-bin.zip"
  if command -v curl >/dev/null 2>&1; then
    curl -fL --retry 2 "https://services.gradle.org/distributions/gradle-$GRADLE_VERSION-bin.zip" -o "$ARCHIVE"
  elif command -v wget >/dev/null 2>&1; then
    wget -O "$ARCHIVE" "https://services.gradle.org/distributions/gradle-$GRADLE_VERSION-bin.zip"
  else
    echo "Install Gradle $GRADLE_VERSION or install curl/wget for first-time download." >&2
    exit 2
  fi
  if command -v unzip >/dev/null 2>&1; then
    unzip -q -o "$ARCHIVE" -d "$(dirname "$CACHE")"
  else
    echo "unzip is required to extract the Gradle distribution." >&2
    exit 2
  fi
fi
exec "$CACHE/bin/gradle" -p "$ROOT" "$@"
