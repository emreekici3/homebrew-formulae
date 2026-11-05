class Cranberry < Formula
  desc "BSP tiling window manager for macOS"
  homepage "https://github.com/emreekici3/cranberry"
  version "0.4.6"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/emreekici3/cranberry/releases/download/v0.4.6/cranberry-aarch64-apple-darwin.tar.gz"
    sha256 "de3173c28f84eeaa3f552c0ee88786a45dde1f943ca305486609d3ea79a8c368"
  end

  on_intel do
    url "https://github.com/emreekici3/cranberry/releases/download/v0.4.6/cranberry-x86_64-apple-darwin.tar.gz"
    sha256 "209ffea8483e663314d8dac3383309bee25fe4d89ac86ccb55983873bfe15014"
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
