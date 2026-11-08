class Whistle < Formula
  desc "HTTP, HTTP2, HTTPS, Websocket debugging proxy"
  homepage "https://github.com/avwo/whistle"
  url "https://registry.npmjs.org/whistle/-/whistle-2.10.3.tgz"
  sha256 "5b27c1650de36d4424521980ef1bb4c1a47206d592b06cc55d45b1a8aff66a3e"
  license "MIT"

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "5569a7c3048d9b9b9b32e20b79f521cd92e52185bdbaabc810dea3497fffa282"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "5569a7c3048d9b9b9b32e20b79f521cd92e52185bdbaabc810dea3497fffa282"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "5569a7c3048d9b9b9b32e20b79f521cd92e52185bdbaabc810dea3497fffa282"
    sha256 cellar: :any_skip_relocation, sonoma:        "b3aec0ae728d66705773026127c63d87d3fd78991b161ace63e81a68286e9d9f"
    sha256 cellar: :any_skip_relocation, ventura:       "b3aec0ae728d66705773026127c63d87d3fd78991b161ace63e81a68286e9d9f"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "5569a7c3048d9b9b9b32e20b79f521cd92e52185bdbaabc810dea3497fffa282"
  end

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    (testpath/"package.json").write('{"name": "test"}')
    system bin/"whistle", "start"
    system bin/"whistle", "stop"
  end
end
