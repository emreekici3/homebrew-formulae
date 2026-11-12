class Cranberry < Formula
  desc "BSP tiling window manager for macOS"
  homepage "https://github.com/emreekici3/cranberry"
  version "0.6.1"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/emreekici3/cranberry/releases/download/v0.6.1/cranberry-aarch64-apple-darwin.tar.gz"
    sha256 "03cee049688df377fa30d1c6b917189f4b2bb751e095dc82c1ea67e2e2fd2db7"
  end

  on_intel do
    url "https://github.com/emreekici3/cranberry/releases/download/v0.6.1/cranberry-x86_64-apple-darwin.tar.gz"
    sha256 "7cbef8528a6f2e0e6d6587e6ff0ef0fa4971eb0c5180871b309c169edcd7c354"
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
