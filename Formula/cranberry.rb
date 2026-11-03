class Cranberry < Formula
  desc "BSP tiling window manager for macOS"
  homepage "https://github.com/emreekici3/cranberry"
  url "https://github.com/emreekici3/cranberry/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "7afa841af0b99f034a7f59d74d86c7c290197ab3c3c604ef5a81264002337fa8"
  license "MIT"
  head "https://github.com/emreekici3/cranberry.git", branch: "master"

  depends_on "rust" => :build
  depends_on :macos

  def install
    system "cargo", "install", *std_cargo_args
    pkgshare.install "examples/cberryrc"
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
