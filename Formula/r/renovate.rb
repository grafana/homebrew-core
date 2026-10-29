class Renovate < Formula
  desc "Automated dependency updates. Flexible so you don't need to be"
  homepage "https://github.com/renovatebot/renovate"
  url "https://registry.npmjs.org/renovate/-/renovate-42.68.5.tgz"
  sha256 "899f002913d8434267a17407c4c091ec137c46acb552b60fd260f25fea2c4615"
  license "AGPL-3.0-only"

  # There are thousands of renovate releases on npm and the page the `Npm`
  # strategy checks is several MB in size and can time out before the request
  # resolves. This checks the first page of tags on GitHub (to minimize data
  # transfer).
  livecheck do
    url "https://github.com/renovatebot/renovate/tags"
    regex(%r{href=["']?[^"' >]*?/tag/v?(\d+(?:\.\d+)+)["' >]}i)
    strategy :page_match
    throttle 10
  end

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "48c5705177c84298a734f41c2ecf7cbf1f388b31f3bafb0ac1df0ed15d6675e6"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "66c2eacb2752d5694e40059064e0c45721efcc87a6a86c6fe2f5c48d8f60c1db"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "22838486684be74d8b5be69a0bef98c669194478862b9651d66f7eb71376bb03"
    sha256 cellar: :any_skip_relocation, sonoma:        "61ade1a1208c44de4dcc7b32a0ed1b46b01bfd3fed320d95352cf9b487a09edf"
    sha256 cellar: :any_skip_relocation, ventura:       "56bcf360f048c08def8c6714b46859446ba8933ca41e2190db7d22a5cb9eec5e"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "8c96e07b80ecc495a2cd218cc8ff3e4c4eaaf9288e6529637fff09027ba79bc5"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "1d72e7191a52dbc0a9783d73f0cf61e1d0934ce3bfaa4f9ff4d03722b0029453"
  end

  depends_on "node@22"

  uses_from_macos "git", since: :monterey

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    system bin/"renovate", "--platform=local", "--enabled=false"
  end
end
