class Cranberry < Formula
  desc "BSP tiling window manager for macOS"
  homepage "https://github.com/emreekici3/cranberry"
  version "0.4.3"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/emreekici3/cranberry/releases/download/v0.4.3/cranberry-aarch64-apple-darwin.tar.gz"
    sha256 "1e2748e60e68a47cd70f9501c659e5be1e4d1ffcf244bcc3c6a9aa19ec553fd6"
  end

  on_intel do
    url "https://github.com/emreekici3/cranberry/releases/download/v0.4.3/cranberry-x86_64-apple-darwin.tar.gz"
    sha256 "d15cd721f0ff883ac14b8bef5a80912b55236abc5c23d1d4a4c7ea49c72d41ed"
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
