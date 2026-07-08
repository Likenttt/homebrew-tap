class GarminMtp < Formula
  desc "Import and export Garmin watch files over MTP"
  homepage "https://github.com/Likenttt/garmin-mtp-cli"
  url "https://github.com/Likenttt/garmin-mtp-cli/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "3364aa69d42965dba7759d78cc26c06f11ceb6bea2534fc51c5bdcbeb0de8cef"
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
