class Cranberry < Formula
  desc "BSP tiling window manager for macOS"
  homepage "https://github.com/emreekici3/cranberry"
  version "0.4.5"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/emreekici3/cranberry/releases/download/v0.4.5/cranberry-aarch64-apple-darwin.tar.gz"
    sha256 "bf11c366422c93e2eccb29f4e4d8e4c9f7c20092e66157a53f1b7e78eea4cd52"
  end

  on_intel do
    url "https://github.com/emreekici3/cranberry/releases/download/v0.4.5/cranberry-x86_64-apple-darwin.tar.gz"
    sha256 "329d1cc731981e72963443b690fc0dbc989455ea65774230f57eefb434885918"
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
