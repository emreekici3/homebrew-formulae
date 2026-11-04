class Cranberry < Formula
  desc "BSP tiling window manager for macOS"
  homepage "https://github.com/emreekici3/cranberry"
  version "0.2.1"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/emreekici3/cranberry/releases/download/v0.2.1/cranberry-aarch64-apple-darwin.tar.gz"
    sha256 "77d50764016f6ee59e10798ca65cb131ecce9ea4a6bad386eb52d497ce21a14d"
  end

  on_intel do
    url "https://github.com/emreekici3/cranberry/releases/download/v0.2.1/cranberry-x86_64-apple-darwin.tar.gz"
    sha256 "14bcc227eb6e2fb2a4e07d1b3ea8fa550af93225c4b6d39353c9f136a56ff32e"
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
