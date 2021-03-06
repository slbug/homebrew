class Httrack < Formula
  homepage "https://www.httrack.com/"
  # Always use mirror.httrack.com when you link to a new version of HTTrack, as
  # link to download.httrack.com will break on next HTTrack update.
  url "https://mirror.httrack.com/historical/httrack-3.48.21.tar.gz"
  sha1 "a19564393ced4b2e22ab685201cbd5a1d6983930"

  bottle do
    sha256 "f74a06fd065898048d3e27aebdf11e5d9bb186586e82264250bcf06a6f6ec37b" => :yosemite
    sha256 "e309068ddd030d866028c6c383d2093fd2a6a62f00817853876f339fb69cc10c" => :mavericks
    sha256 "2097533c4e53afdc801075cef34c5a15819e51c4e0de4f9717bb958d9eace283" => :mountain_lion
  end

  depends_on "openssl"

  def install
    ENV.deparallelize
    system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
    system "make", "install"
    # Don't need Gnome integration
    rm_rf Dir["#{share}/{applications,pixmaps}"]
  end
end
