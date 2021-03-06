class Libsixel < Formula
  desc "SIXEL encoder/decoder implementation"
  homepage "https://github.com/saitoha/sixel"
  url "https://github.com/saitoha/libsixel/releases/download/v1.8.5/libsixel-1.8.5.tar.gz"
  sha256 "74e7d2b53c4364ccb3afb8d00dafd4061f7b9a65edd3fdb330647d8294400e59"

  bottle do
    cellar :any
    sha256 "ebc6eedece1e35507982ff22fc8b7ef0276f299ce8baea9454a11dd7277b958b" => :catalina
    sha256 "e3cfac40fcc994b9288030fafb9a54786db54c554d01e5c0752d1503edf7557c" => :mojave
    sha256 "a2f8006bcc498f77684aeefacd939796df48839c9a174fec3ba2f0747a943886" => :high_sierra
  end

  depends_on "jpeg"

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--with-jpeg=#{Formula["jpeg"].prefix}",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    fixture = test_fixtures("test.png")
    system "#{bin}/img2sixel", fixture
  end
end
