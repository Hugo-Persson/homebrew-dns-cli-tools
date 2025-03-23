class DnsCliTools < Formula
  desc "A CLI tool to manage dns entries"
  homepage "https://github.com/Hugo-Persson/dns-cli-tools"
  version "1.0.20"
  @github_base_url = "https://github.com/Hugo-Persson/dns-cli-tools/releases/download/#{version}"
  @mac_sha = "af906bcd0dcf9f063062b4613d082b6c42b9659e60d4fc6432fa6870d29eae10"
  @linux_sha = "3f832b3bf6d156d98ad8ae7b98bc71fee41c1308d2f5fdec02de24cedacf59b4"
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
