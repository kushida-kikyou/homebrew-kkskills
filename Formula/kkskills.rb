class Kkskills < Formula
  desc "CLI tool to manage and link AI agent skills"
  homepage "https://github.com/<你的用户名>/kkskills"
  url "https://github.com/<你的用户名>/kkskills/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "替换成真实sha256"
  license "MIT"

  def install
    bin.install "bin/kkskills"

    # 安装 lib 目录（关键）
    libexec.install Dir["lib"]

    # 让脚本能找到 lib
    (bin/"kkskills").write <<~EOS
      #!/bin/bash
      exec "#{libexec}/bin/kkskills" "$@"
    EOS
  end

  test do
    system "#{bin}/kkskills", "--help"
  end
end
