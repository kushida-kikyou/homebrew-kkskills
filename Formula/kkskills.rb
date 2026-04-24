class Kkskills < Formula
  desc "CLI tool to manage and link AI agent skills"
  homepage "https://github.com/<你的用户名>/kkskills"
  url "https://github.com/kikyou/kkskills/archive/refs/tags/0.0.1.tar.gz"
  sha256 "f0878d62265724ceff95d10a1852be2f029be11f8f20ad893c7075e4b52580cf  kkskills.tar.gz"
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
