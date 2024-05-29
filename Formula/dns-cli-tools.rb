class DnsCliTools < Formula
  desc "A CLI tool to manage dns entries"
  homepage "https://github.com/Hugo-Persson/dns-cli-tools"
  version "1.0.15"
  @github_base_url = "https://github.com/Hugo-Persson/dns-cli-tools/releases/download/#{version}"
  @mac_sha = "54c17604950572138a5b0e1d9edb9122824cf004ac77685ec598b8028c74559b"
  @linux_sha = "1623892130ada6e7867c890060012f8213a6447e6b8133cf5fe9a36adf051a5b"
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
