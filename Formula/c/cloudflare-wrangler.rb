class CloudflareWrangler < Formula
  desc "CLI tool for Cloudflare Workers"
  homepage "https://github.com/cloudflare/workers-sdk"
  url "https://registry.npmjs.org/wrangler/-/wrangler-4.59.1.tgz"
  sha256 "f38eb0e278dc0c56873d138aadb0a12e4c03aee8d567163f71fc4a30d393d5f1"
  license any_of: ["Apache-2.0", "MIT"]

  bottle do
    sha256 cellar: :any,                 arm64_sequoia: "e30d5bb362e5dc63d01cb06bb9d3225ec21558eff57ae11d532edc290cbf2850"
    sha256 cellar: :any,                 arm64_sonoma:  "e30d5bb362e5dc63d01cb06bb9d3225ec21558eff57ae11d532edc290cbf2850"
    sha256 cellar: :any,                 arm64_ventura: "e30d5bb362e5dc63d01cb06bb9d3225ec21558eff57ae11d532edc290cbf2850"
    sha256                               sonoma:        "144e3ff58f8f4414a96979b0ce2563cacea88c0f9757102dde7eee5620607348"
    sha256                               ventura:       "144e3ff58f8f4414a96979b0ce2563cacea88c0f9757102dde7eee5620607348"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "32be8a80d829474f9c559f8201a8ac5413745c2314c3946b70978072e2a72475"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "f5ab541d4ea090d8bbbdb39adb0da30234deca807f9b3e587cb091b671df82ba"
  end

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/wrangler*"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wrangler -v")
    assert_match "Required Worker name missing", shell_output("#{bin}/wrangler secret list 2>&1", 1)
  end
end
