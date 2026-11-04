class Cranberry < Formula
  desc "BSP tiling window manager for macOS"
  homepage "https://github.com/emreekici3/cranberry"
  version "0.2.2"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/emreekici3/cranberry/releases/download/v0.2.2/cranberry-aarch64-apple-darwin.tar.gz"
    sha256 "a70259874986da1a424f72be32f55c89f884b4e58575fb6777bbbb43c2d22c43"
  end

  on_intel do
    url "https://github.com/emreekici3/cranberry/releases/download/v0.2.2/cranberry-x86_64-apple-darwin.tar.gz"
    sha256 "2754294bafc832b5cf62ba15816e60b0d170c3cf3684ac8b76fc3de344e9278f"
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
