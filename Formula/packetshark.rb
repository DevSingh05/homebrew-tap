class Packetshark < Formula
  desc "Terminal UI for Wireshark, powered by sharkd"
  homepage "https://github.com/DevSingh05/packetshark"
  version "0.1.1"
  license "MIT"

  # packetshark drives sharkd, which ships with Wireshark's command-line tools.
  depends_on "wireshark"

  on_macos do
    on_arm do
      url "https://github.com/DevSingh05/packetshark/releases/download/v0.1.1/packetshark-aarch64-apple-darwin.tar.gz"
      sha256 "990739bf1e3f151ebae5aa10650170359be9050683563fbd39d546fca3d46553"
    end
    on_intel do
      url "https://github.com/DevSingh05/packetshark/releases/download/v0.1.1/packetshark-x86_64-apple-darwin.tar.gz"
      sha256 "85e036367db35b6d2f95e567e69a919999e8b9d4a644bac2dafc31c451a68f72"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/DevSingh05/packetshark/releases/download/v0.1.1/packetshark-aarch64-unknown-linux-musl.tar.gz"
      sha256 "b17710424ba43d045a82462901c9ea162237f747fdf4a32361feab8d6c7fa422"
    end
    on_intel do
      url "https://github.com/DevSingh05/packetshark/releases/download/v0.1.1/packetshark-x86_64-unknown-linux-musl.tar.gz"
      sha256 "c6d01b6d41ab5b479b91b78904bb0ecb94217bdb80c0ed444ecd7db4cdb046df"
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
