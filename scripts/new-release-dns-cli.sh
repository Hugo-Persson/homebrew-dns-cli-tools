#!/bin/bash
get_latest_release() {
  curl --silent "https://api.github.com/repos/$1/releases/latest" | # Get latest release from GitHub api
    grep '"tag_name":' |                                            # Get tag line
    sed -E 's/.*"([^"]+)".*/\1/'                                    # Pluck JSON value
}

VERSION=$(curl --silent "https://api.github.com/repos/Hugo-Persson/dns-cli-tools/releases/latest" | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')
echo "Updating to version $VERSION"

# cd to script dir

# Get the directory path of the script being run
script_dir=$(dirname "$(readlink -f "$0")")

# Change the working directory to the script's directory
cd "$script_dir"
cd ..
cd Formula

ls -la
sed -i '' "s/version \"[0-9]\.[0-9]\.[0-9]\"/version \"$VERSION\"/" ./dns-cli-tools.rb

BASE_URL="https://github.com/Hugo-Persson/dns-cli-tools/releases/download/$VERSION"

MAC_NAME="dns-cli-macos-arm64.tar.gz"
LINUX_NAME="dns-cli-linux-amd64.tar.gz"

wget -q "$BASE_URL/$MAC_NAME"
MAC_SHA=$(shasum -a 256 "$MAC_NAME" | awk '{ print $1 }')
sed -i '' "s/mac_sha = ".*"/mac_sha = \"$MAC_SHA\"/" ./dns-cli-tools.rb
rm "$MAC_NAME"

wget -q "$BASE_URL/$LINUX_NAME" >/dev/null
LINUX_SHA=$(shasum -a 256 "$LINUX_NAME" | awk '{ print $1 }')
sed -i '' "s/linux_sha = ".*"/linux_sha = \"$LINUX_SHA\"/" ./dns-cli-tools.rb
rm "$LINUX_NAME"
