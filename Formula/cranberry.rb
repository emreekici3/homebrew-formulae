class Cranberry < Formula
  desc "BSP tiling window manager for macOS"
  homepage "https://github.com/emreekici3/cranberry"
  version "0.5.3"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/emreekici3/cranberry/releases/download/v0.5.3/cranberry-aarch64-apple-darwin.tar.gz"
    sha256 "fac016db23036c7af82f2475f79c5d1eb0b0d868cc1ae1e1ad34352870362021"
  end

  on_intel do
    url "https://github.com/emreekici3/cranberry/releases/download/v0.5.3/cranberry-x86_64-apple-darwin.tar.gz"
    sha256 "38618e8d9aceeaae4dce268125b8877b83427fc7102ed7e47076c9ceb2b4f120"
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
