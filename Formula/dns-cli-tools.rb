class DnsCliTools < Formula
  desc "A CLI tool to manage dns entries"
  homepage "https://github.com/Hugo-Persson/dns-cli-tools"
  version "1.0.7"
  @github_base_url = "https://github.com/Hugo-Persson/dns-cli-tools/releases/download/#{version}"
  mac_sha "1b8c4d8854b4bf586793e2cf615d2705bf31ce624ae0d0dbb42f27be569f605b"
  linux_sha "0932c974baf3bb89da383ca65c139ab66736325e3430bcf7d81fb838e68ebb6b"
  on_macos do
    url "#{@github_base_url}dns-cli-macos-arm64.tar.gz"
    sha256 mac_sha
  end

  # Define the URL and SHA256 for Linux
  on_linux do
    url "#{@github_base_url}/dns-cli-linux-amd64.tar.gz"
    sha256 linux_sha
  end

  def install
    bin.install "build/dns-cli"
  end

  test do
    system "#{bin}/dns-cli"
  end
end
