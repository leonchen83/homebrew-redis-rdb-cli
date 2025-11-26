class RedisRdbCli < Formula
  desc "CLI tools for parsing, converting Redis RDB files, and migrating Redis data"
  homepage "https://github.com/leonchen83/redis-rdb-cli"
  url "https://github.com/leonchen83/redis-rdb-cli/releases/download/v0.9.9/redis-rdb-cli-release.tar.gz"
  version "0.9.9"
  sha256 "2ff5c14a26fc850be4aef270ab3911afab4467e6b33721660dc38096466c024c"

  depends_on "openjdk"

  def install
    libexec.install Dir["*"]

    Dir["#{libexec}/bin/*"].each do |file|
      next if file.end_with?(".cmd")
      (bin/File.basename(file)).write_env_script file, {}
    end
  end

  test do
    system "#{bin}/rct", "--help"
  end
end