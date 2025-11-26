class RedisRdbCli < Formula
  desc "CLI tools for parsing, converting Redis RDB files, and migrating Redis data"
  homepage "https://github.com/leonchen83/redis-rdb-cli"
  url "https://github.com/leonchen83/redis-rdb-cli/releases/download/v0.9.8/redis-rdb-cli-release.tar.gz"
  version "0.9.8"
  sha256 "1e17e7379adf6f91679c7e3410e701b7e9dd1f755f69e8e267c02d68645b1105"

  depends_on "openjdk"

  def install
    libexec.install Dir["*"]

    Dir["#{libexec}/bin/*"].each do |file|
      bin.install_symlink file
    end
  end

  test do
    system "#{bin}/rct", "--help"
  end
end