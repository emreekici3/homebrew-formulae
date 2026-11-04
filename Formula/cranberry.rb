class Cranberry < Formula
  desc "BSP tiling window manager for macOS"
  homepage "https://github.com/emreekici3/cranberry"
  version "0.4.2"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/emreekici3/cranberry/releases/download/v0.4.2/cranberry-aarch64-apple-darwin.tar.gz"
    sha256 "baae0cc774ba7ee4d5aa5ffde574c747f47e70567d95978b85b240eede91d01e"
  end

  on_intel do
    url "https://github.com/emreekici3/cranberry/releases/download/v0.4.2/cranberry-x86_64-apple-darwin.tar.gz"
    sha256 "865692f4aaf348b19f48eead9e14a2587bae49067f159b0e30d8b58093fe4830"
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
