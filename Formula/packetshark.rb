class Packetshark < Formula
  desc "Terminal UI for Wireshark, powered by sharkd"
  homepage "https://github.com/DevSingh05/packetshark"
  version "0.1.0"
  license "MIT"

  # packetshark drives sharkd, which ships with Wireshark's command-line tools.
  depends_on "wireshark"

  on_macos do
    on_arm do
      url "https://github.com/DevSingh05/packetshark/releases/download/v0.1.0/packetshark-aarch64-apple-darwin.tar.gz"
      sha256 "f90d05c340f0c9aafb58feae7aaa1b6bd30775ea1b7aed666bfeab7b6f91a9d8"
    end
    on_intel do
      url "https://github.com/DevSingh05/packetshark/releases/download/v0.1.0/packetshark-x86_64-apple-darwin.tar.gz"
      sha256 "f9bca0651ffe5b8431c9f05a9efb1bb2360769e8fd7f3b04058a256b016d2a43"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/DevSingh05/packetshark/releases/download/v0.1.0/packetshark-aarch64-unknown-linux-musl.tar.gz"
      sha256 "9300b0ec41d4c4b30ca532c48b6c29f7cf082d1d89f8c8c0b887986eb57e390a"
    end
    on_intel do
      url "https://github.com/DevSingh05/packetshark/releases/download/v0.1.0/packetshark-x86_64-unknown-linux-musl.tar.gz"
      sha256 "561f599dae9bd709e80b2bc442345d34709492874fd1f4dd38c2a3253259b7db"
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
