class Cranberry < Formula
  desc "BSP tiling window manager for macOS"
  homepage "https://github.com/emreekici3/cranberry"
  version "0.2.3"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/emreekici3/cranberry/releases/download/v0.2.3/cranberry-aarch64-apple-darwin.tar.gz"
    sha256 "2c86d2ebb88fca4f31092730f5ed6ec0006b9b322859fabeab08a09b75362637"
  end

  on_intel do
    url "https://github.com/emreekici3/cranberry/releases/download/v0.2.3/cranberry-x86_64-apple-darwin.tar.gz"
    sha256 "8dd2185bd0c488e8ec501b723c63db55fb4ea8302df74c88f910b03b7959bd56"
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
