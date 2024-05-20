class DnsCliTools < Formula
  desc "A CLI tool to manage dns entries"
  homepage "https://github.com/Hugo-Persson/dns-cli-tools"
  version "1.0.9"
  @github_base_url = "https://github.com/Hugo-Persson/dns-cli-tools/releases/download/#{version}"
  @mac_sha = "4d01c0837645807329cd4b1798f5d4b98c2e79f07cc6a5c296254dff6dd37ecb"
  @linux_sha = "b8b037fb4fcf9c6e3c5733c4ccf8973ec86e03e45e6e3a8f626d92ad1ba7e23a"
  on_macos do
    url "#{@github_base_url}dns-cli-macos-arm64.tar.gz"
    sha256 @mac_sha
  end

  # Define the URL and SHA256 for Linux
  on_linux do
    url "#{@github_base_url}/dns-cli-linux-amd64.tar.gz"
    sha256 @linux_sha
  end

  def install
    bin.install "dns-cli"
  end

  test do
    system "#{bin}/dns-cli"
  end
end
