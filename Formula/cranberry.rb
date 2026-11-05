class Cranberry < Formula
  desc "BSP tiling window manager for macOS"
  homepage "https://github.com/emreekici3/cranberry"
  version "0.5.0"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/emreekici3/cranberry/releases/download/v0.5.0/cranberry-aarch64-apple-darwin.tar.gz"
    sha256 "e3f3b0ccfede32c9987af4ee0403ceb87fccdbea5dd22003e8596440e57985de"
  end

  on_intel do
    url "https://github.com/emreekici3/cranberry/releases/download/v0.5.0/cranberry-x86_64-apple-darwin.tar.gz"
    sha256 "57ec00b3db3e7fd3c1225c8e76042a2ae6b5daa57978ceb4c740933095f1ba34"
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
