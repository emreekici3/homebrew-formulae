class Cranberry < Formula
  desc "BSP tiling window manager for macOS"
  homepage "https://github.com/emreekici3/cranberry"
  version "0.5.2"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/emreekici3/cranberry/releases/download/v0.5.2/cranberry-aarch64-apple-darwin.tar.gz"
    sha256 "f3aa1d26f209e1647ef3a94318ea729f278254f9c95e26596ebddb691f5060f3"
  end

  on_intel do
    url "https://github.com/emreekici3/cranberry/releases/download/v0.5.2/cranberry-x86_64-apple-darwin.tar.gz"
    sha256 "641e786fac17c8b9a110bc8426542d0cb39c13f519792345684a6639055b96e4"
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
