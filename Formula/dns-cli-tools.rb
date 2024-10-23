class DnsCliTools < Formula
  desc "A CLI tool to manage dns entries"
  homepage "https://github.com/Hugo-Persson/dns-cli-tools"
  version "1.0.19"
  @github_base_url = "https://github.com/Hugo-Persson/dns-cli-tools/releases/download/#{version}"
  @mac_sha = "ca7d95a7964c29fb8d7e0a2d22758e6e41f310f3bbd2ec00597d34282f5b4081"
  @linux_sha = "d457f00e9c1f222465da4297e1c13d63a0344176831c30a751d916e6bd2742c9"
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
