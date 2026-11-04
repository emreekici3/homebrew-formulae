class Cranberry < Formula
  desc "BSP tiling window manager for macOS"
  homepage "https://github.com/emreekici3/cranberry"
  version "0.3.0"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/emreekici3/cranberry/releases/download/v0.3.0/cranberry-aarch64-apple-darwin.tar.gz"
    sha256 "99552209e71b76f467f2da3e37a9d7d95dc41a5e86a97d057230d03a4afd2a05"
  end

  on_intel do
    url "https://github.com/emreekici3/cranberry/releases/download/v0.3.0/cranberry-x86_64-apple-darwin.tar.gz"
    sha256 "09a5642fc6e36f25b612cb4347c73b1aff2681dc758ddd4e1d5f6b4aa4f71337"
  end

  def install
    bin.install "cberry"
    pkgshare.install "cberryrc"
  end

  def caveats
    <<~EOS
      Copy the example config, then start the service:
        mkdir -p ~/.config/cranberry
        cp #{opt_pkgshare}/cberryrc ~/.config/cranberry/cberryrc
        cberry install
        cberry start

      Enable cberry under System Settings > Privacy & Security > Accessibility.
    EOS
  end

  test do
    assert_match "cberry", shell_output("#{bin}/cberry --help")
  end
end
