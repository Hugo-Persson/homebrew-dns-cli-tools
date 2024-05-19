class DnsCliTools < Formula
  desc "A CLI tool to manage dns entries"
  homepage "https://github.com/Hugo-Persson/dns-cli-tools"
  version "1.0.5"
  on_macos do
    url "https://github.com/Hugo-Persson/dns-cli-tools/releases/download/#{version}/dns-cli-macos-arm64.tar.gz"
    sha256 "8a071d3833347fecda9a9afc06bd880d8bfef28b3f960a5027538ecf128b3d7a"
  end

  # Define the URL and SHA256 for Linux
  on_linux do
    url "https://github.com/Hugo-Persson/dns-cli-tools/releases/download/#{version}/dns-cli-linux-amd64.tar.gz"
    sha256 "349281dd23ad3a086be98064c9b42c78aea2285fcc1446513ed6b97863423698"
  end

  def install
    bin.install "dns-cli"
  end

  test do
    system "#{bin}/dns-cli"
  end
end
