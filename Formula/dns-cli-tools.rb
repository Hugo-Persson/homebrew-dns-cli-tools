class DnsCliTools < Formula
  desc "A CLI tool to manage dns entries"
  homepage "https://github.com/Hugo-Persson/dns-cli-tools"
  version "1.0.15"
  @github_base_url = "https://github.com/Hugo-Persson/dns-cli-tools/releases/download/#{version}"
  @mac_sha = "927e772cb72cd378efd30542ea522262d1f0bca6df2a623a39ff5fdf40b3217e"
  @linux_sha = "28586f1c71d7df28c54c6cf227e355d5d2b0a4fcc04c80abbaa27b9e891fd32b"
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
