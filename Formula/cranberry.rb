class Cranberry < Formula
  desc "BSP tiling window manager for macOS"
  homepage "https://github.com/emreekici3/cranberry"
  version "0.4.8"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/emreekici3/cranberry/releases/download/v0.4.8/cranberry-aarch64-apple-darwin.tar.gz"
    sha256 "d050afa7078b812e28e36b0b54dbde2540c24449ce24fbe78531000d6b01a670"
  end

  on_intel do
    url "https://github.com/emreekici3/cranberry/releases/download/v0.4.8/cranberry-x86_64-apple-darwin.tar.gz"
    sha256 "25f03ec09a07ac71199923b34a69996de08993e0b899ec68a8ebb1347a885406"
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
