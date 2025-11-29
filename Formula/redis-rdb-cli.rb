class RedisRdbCli < Formula
  desc "CLI tools for parsing, converting Redis RDB files, and migrating Redis data"
  homepage "https://github.com/leonchen83/redis-rdb-cli"
  url "https://github.com/leonchen83/redis-rdb-cli/releases/download/v0.9.10/redis-rdb-cli-release.tar.gz"
  version "0.9.10"
  sha256 "5bce744819566dd9ba020faca65621de89851ac258528ab32359100da58704fa"

  depends_on "openjdk"

  def install
    libexec.install Dir["*"]

    Dir["#{libexec}/bin/*"].each do |file|
      next if file.end_with?(".cmd")
      bin.install_symlink file
    end
  end

  test do
    system "#{bin}/rct", "--help"
  end
end