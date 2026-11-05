class Cranberry < Formula
  desc "BSP tiling window manager for macOS"
  homepage "https://github.com/emreekici3/cranberry"
  version "0.4.7"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/emreekici3/cranberry/releases/download/v0.4.7/cranberry-aarch64-apple-darwin.tar.gz"
    sha256 "f0bab06a292c1cff68b4814307290d994cf5acac619c0fab9bc0095a2c8d2421"
  end

  on_intel do
    url "https://github.com/emreekici3/cranberry/releases/download/v0.4.7/cranberry-x86_64-apple-darwin.tar.gz"
    sha256 "d0882228f9b7355fb659d12399d232f19d9d331960c196cbb9103c834befbda7"
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
