class Kkskills < Formula
  desc "CLI tool to manage and link AI agent skills"
  homepage "https://github.com/kushida-kikyou/kkskills"
  url "https://github.com/kushida-kikyou/kkskills/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "f0878d62265724ceff95d10a1852be2f029be11f8f20ad893c7075e4b52580cf"
  license "MIT"

  def install
    # 安装全部文件到 libexec
    libexec.install Dir["*"]

    # 创建可执行入口
    (bin/"kkskills").write <<~EOS
      #!/bin/bash
      exec "#{libexec}/bin/kkskills" "$@"
    EOS
  end

  test do
    system "#{bin}/kkskills", "--help"
  end
end
