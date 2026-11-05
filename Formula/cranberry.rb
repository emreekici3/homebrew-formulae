class Cranberry < Formula
  desc "BSP tiling window manager for macOS"
  homepage "https://github.com/emreekici3/cranberry"
  version "0.5.1"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/emreekici3/cranberry/releases/download/v0.5.1/cranberry-aarch64-apple-darwin.tar.gz"
    sha256 "6e08853c649e9af0f66d749758df5fcd0eff6aa3358554fe441df66a29164132"
  end

  on_intel do
    url "https://github.com/emreekici3/cranberry/releases/download/v0.5.1/cranberry-x86_64-apple-darwin.tar.gz"
    sha256 "c0575a2717e4270d18cfaae167754e53e9feb518c78f5488be508496a84538b4"
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
