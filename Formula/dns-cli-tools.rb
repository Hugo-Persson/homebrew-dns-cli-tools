class DnsCliTools < Formula
  desc "A CLI tool to manage dns entries"
  homepage "https://github.com/Hugo-Persson/dns-cli-tools"
  version "1.0.21"
  @github_base_url = "https://github.com/Hugo-Persson/dns-cli-tools/releases/download/#{version}"
  @mac_sha = "fc7514b90d718cf961935836c0e9022d21a9a728f60225191341e610e6f08085"
  @linux_sha = "f651771b69f141525f6d34afdc481e4ba14145750b9ce339af125d7d9705b5db"
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
