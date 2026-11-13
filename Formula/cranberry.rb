class Cranberry < Formula
  desc "BSP tiling window manager for macOS"
  homepage "https://github.com/emreekici3/cranberry"
  version "0.6.2"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/emreekici3/cranberry/releases/download/v0.6.2/cranberry-aarch64-apple-darwin.tar.gz"
    sha256 "1018096305aa4223d4989ed7d58819db87e245023bb024de51258a805d5530ac"
  end

  on_intel do
    url "https://github.com/emreekici3/cranberry/releases/download/v0.6.2/cranberry-x86_64-apple-darwin.tar.gz"
    sha256 "93f7af0eb354ae3eb6eeb95d13ff9f2eed59371c69d43595fbd9adcb768670e3"
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
