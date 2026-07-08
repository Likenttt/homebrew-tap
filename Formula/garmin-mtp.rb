class GarminMtp < Formula
  desc "Import and export Garmin watch files over MTP"
  homepage "https://github.com/Likenttt/garmin-mtp-cli"
  url "https://github.com/Likenttt/garmin-mtp-cli/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "dae7243f4a83cb50ce85ef0322ce2398421b66afa1019a2f64aaa0b78290209f"
  license "MIT"

  depends_on "pkgconf" => :build
  depends_on "libmtp"

  def install
    system "make"
    bin.install "build/garmin-mtp"
    bin.install "build/garminmtp"
  end

  test do
    assert_match "garmin-mtp", shell_output("#{bin}/garmin-mtp --help")
    assert_match "Garmin MTP directory manual", shell_output("#{bin}/garminmtp menu")
  end
end
