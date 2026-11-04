class Cranberry < Formula
  desc "BSP tiling window manager for macOS"
  homepage "https://github.com/emreekici3/cranberry"
  version "0.4.4"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/emreekici3/cranberry/releases/download/v0.4.4/cranberry-aarch64-apple-darwin.tar.gz"
    sha256 "621b0434fee9d1f4bfe2e569901d735f2763f1e8a3a8828100ecc842127faea9"
  end

  on_intel do
    url "https://github.com/emreekici3/cranberry/releases/download/v0.4.4/cranberry-x86_64-apple-darwin.tar.gz"
    sha256 "1925ad337fdfe764a74188bbf810cb774acf534d42c5b185b14ecd6e98eccfd2"
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
