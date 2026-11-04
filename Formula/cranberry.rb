class Cranberry < Formula
  desc "BSP tiling window manager for macOS"
  homepage "https://github.com/emreekici3/cranberry"
  version "0.4.1"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/emreekici3/cranberry/releases/download/v0.4.1/cranberry-aarch64-apple-darwin.tar.gz"
    sha256 "9840cecadf3b87df3edc82de4fb49545530c763a87c3762fb29485db936974bb"
  end

  on_intel do
    url "https://github.com/emreekici3/cranberry/releases/download/v0.4.1/cranberry-x86_64-apple-darwin.tar.gz"
    sha256 "47ddd3895170ef5c65e3014f6115332103d60e8b5d92a3bc736b6b2a467fe7d3"
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
