class Cranberry < Formula
  desc "BSP tiling window manager for macOS"
  homepage "https://github.com/emreekici3/cranberry"
  version "0.6.0"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/emreekici3/cranberry/releases/download/v0.6.0/cranberry-aarch64-apple-darwin.tar.gz"
    sha256 "df2a70618ae2ff5d2288c7511ae2beed6a443489c60e9d6eaf59f9fc41c881d7"
  end

  on_intel do
    url "https://github.com/emreekici3/cranberry/releases/download/v0.6.0/cranberry-x86_64-apple-darwin.tar.gz"
    sha256 "d886593240b71ce3ee13b3afe36c1475edce282f56ca71923b4d03259ba6d03a"
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
