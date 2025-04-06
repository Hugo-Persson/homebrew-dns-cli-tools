class DnsCliTools < Formula
  desc "A CLI tool to manage dns entries"
  homepage "https://github.com/Hugo-Persson/dns-cli-tools"
  version "1.0.22"
  @github_base_url = "https://github.com/Hugo-Persson/dns-cli-tools/releases/download/#{version}"
  @mac_sha = "fb2e4a7fbb2c4270130640ad540d6397e59c2f759ca687d5a33b31dcccf341e4"
  @linux_sha = "9150044b8c284dd789df40f9cd00a89ba0d36c3d12276d22872b1669a6fe2c41"
  on_macos do
    url "#{@github_base_url}/dns-cli-macos-arm64.tar.gz"
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
