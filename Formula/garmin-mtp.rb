class GarminMtp < Formula
  desc "Import and export Garmin watch files over MTP"
  homepage "https://github.com/Likenttt/garmin-mtp-cli"
  url "https://github.com/Likenttt/garmin-mtp-cli/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "e007dad25c86b5ac39065bab446c0893cfa31cfa977a3476ec9130058b50d2e0"
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
