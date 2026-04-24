class Kkskills < Formula
  desc "CLI tool to manage and link AI agent skills"
  homepage "https://github.com/<你的用户名>/kkskills"
  url "https://github.com/<你的用户名>/kkskills/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5  kkskills.tar.gz"
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
