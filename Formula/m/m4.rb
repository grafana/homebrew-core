class M4 < Formula
  desc "Macro processing language"
  homepage "https://www.gnu.org/software/m4/"
  url "https://ftp.gnu.org/gnu/m4/m4-1.4.19.tar.xz"
  mirror "https://ftpmirror.gnu.org/m4/m4-1.4.19.tar.xz"
  sha256 "63aede5c6d33b6d9b13511cd0be2cac046f2e70fd0a07aa9573a04a82783af96"
  license "GPL-3.0-or-later"

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_sequoia:  "2d39513c268897aab9072ce6b0e15dc8a0a78fc76543e4f25b1cf784ffd976f9"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:   "f42d89db519a07d67bcaead6c8dfb2da45e8266bebb996dd8b3f19b1ca13b8a0"
    sha256 cellar: :any_skip_relocation, arm64_ventura:  "11308abe8d607be35da9e88a1d789f191914bf043bca4fdde2b50a6cbf1713cc"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "8e9fa0d7d946f7c38e1a6f596aab3169d2440fccd34ec321b9a032d903ec951c"
    sha256 cellar: :any_skip_relocation, arm64_big_sur:  "ea1be04e51645f9e31c8d2cab6d144bb7f47efb1f35214b9f1014e27db5a3bc1"
    sha256 cellar: :any_skip_relocation, sequoia:        "16d2da5d758ce23c24fe59d1659ff7ecf076f51105fc4797e0d6b0e6c28fbdc5"
    sha256 cellar: :any_skip_relocation, sonoma:         "8434a67a4383836b2531a6180e068640c5b482ee6781b673d65712e4fc86ca76"
    sha256 cellar: :any_skip_relocation, ventura:        "0c7707d23c005fb7cfae158c696f3173698feca3a535d8f22959df18b9659575"
    sha256 cellar: :any_skip_relocation, monterey:       "8a17c921e5135206c382fc67ae53ba8835684dac5bfe7eb2bcdfa79df4d2731d"
    sha256 cellar: :any_skip_relocation, big_sur:        "b22472f659112cf12163bba770d891618b3ada5aaf5baa01516d80fef6214617"
    sha256 cellar: :any_skip_relocation, catalina:       "e0fec6a49fd80cc7279c71f319d70d01ed49e894b53cd91e39f170288232fa93"
    sha256 cellar: :any_skip_relocation, mojave:         "0cf53207764a2311db75b19628e2395ac6655ea1f7fdac97a33a0de34f315018"
    sha256                               arm64_linux:    "c26b282ce0d99dcfa4aa0946ffcce44f2a18ec9c0e1fd1bcc4986d698f4e0ec1"
    sha256                               x86_64_linux:   "f6d1087a51e0ff2e582b3043a25a51b67971b2246cf65167ef3abf1230160f04"
  end

  keg_only :provided_by_macos

  def install
    system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
    system "make"
    system "make", "install"
  end

  test do
    assert_match "Homebrew",
      pipe_output(bin/"m4", "define(TEST, Homebrew)\nTEST\n")
  end
end
