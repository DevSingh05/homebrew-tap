class Packetshark < Formula
  desc "Terminal UI for Wireshark, powered by sharkd"
  homepage "https://github.com/DevSingh05/packetshark"
  license "MIT"

  # packetshark drives sharkd, which ships with Wireshark's command-line tools.
  depends_on "wireshark"

  on_macos do
    on_arm do
      url "https://github.com/DevSingh05/packetshark/releases/download/v0.3.0/packetshark-aarch64-apple-darwin.tar.gz"
      sha256 "6b78425ff57ff42fbacaa528e5cbdca76fb153a0d0f9e3dfdde302d4acdf5f8a"
    end
    on_intel do
      url "https://github.com/DevSingh05/packetshark/releases/download/v0.3.0/packetshark-x86_64-apple-darwin.tar.gz"
      sha256 "b649e699c70166d7be42e8ac7192bc02696d158d84701f89e99b5945cceb0614"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/DevSingh05/packetshark/releases/download/v0.3.0/packetshark-aarch64-unknown-linux-musl.tar.gz"
      sha256 "16d4d75e51433cb218e153568c7dda4d75b3908728d621e51370ca3d578f9eea"
    end
    on_intel do
      url "https://github.com/DevSingh05/packetshark/releases/download/v0.3.0/packetshark-x86_64-unknown-linux-musl.tar.gz"
      sha256 "a2e42739e47e97e5aee7323703cfaa46a185bf96632fe517181b861cf6a22398"
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
