class DnsCliTools < Formula
  desc "A CLI tool to manage dns entries"
  homepage "https://github.com/Hugo-Persson/dns-cli-tools"
  version "1.0.18"
  @github_base_url = "https://github.com/Hugo-Persson/dns-cli-tools/releases/download/#{version}"
  @mac_sha = "b3e2bca4b4f410b2333109994f50fcb56b9f936867ed2e4846848c14c104b1c3"
  @linux_sha = "be50099b3ebb789c7c0d99641a4e9880fa4e99130042430db28953e31dd96409"
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
