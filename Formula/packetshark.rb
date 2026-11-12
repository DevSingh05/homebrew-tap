class Packetshark < Formula
  desc "Terminal UI for Wireshark, powered by sharkd"
  homepage "https://github.com/DevSingh05/packetshark"
  version "0.2.0"
  license "MIT"

  # packetshark drives sharkd, which ships with Wireshark's command-line tools.
  depends_on "wireshark"

  on_macos do
    on_arm do
      url "https://github.com/DevSingh05/packetshark/releases/download/v0.2.0/packetshark-aarch64-apple-darwin.tar.gz"
      sha256 "1185818abb6ddb1e6ea6addb65acca0d2ed6df423b85d6cb41050072432dda34"
    end
    on_intel do
      url "https://github.com/DevSingh05/packetshark/releases/download/v0.2.0/packetshark-x86_64-apple-darwin.tar.gz"
      sha256 "98d8bc0386276eb37e03699300a3b5902643262c1825dc2d5f7d61773b8793bb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/DevSingh05/packetshark/releases/download/v0.2.0/packetshark-aarch64-unknown-linux-musl.tar.gz"
      sha256 "a222a3bc4677debee6ece8f1c48e072690cc488c91501e25ddde25c6cfba0fcb"
    end
    on_intel do
      url "https://github.com/DevSingh05/packetshark/releases/download/v0.2.0/packetshark-x86_64-unknown-linux-musl.tar.gz"
      sha256 "5587f1c14e1ccca3777fbf9c54ad0b59dcb9e8ce73f1b99742febf8ffbacd487"
    end
  end

  def install
    bin.install "packetshark"
    pkgshare.install "config.example.toml"
    doc.install "README.md"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/packetshark --version")
  end
end
