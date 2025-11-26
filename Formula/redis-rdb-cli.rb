class RedisRdbCli < Formula
  desc "CLI tools for parsing, converting Redis RDB files, and migrating Redis data"
  homepage "https://github.com/leonchen83/redis-rdb-cli"
  url "https://github.com/leonchen83/redis-rdb-cli/releases/download/v0.9.9/redis-rdb-cli-release.tar.gz"
  version "0.9.9"
  sha256 "65d5e40333694a5495a5929b6c73e59b57fa904c75db9cd23b46301969d5b9be"

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