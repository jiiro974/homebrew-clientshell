class CsToolbox < Formula
  desc "70+ SOC/security diagnostic tools for MSP teams"
  homepage "https://jiiro974.github.io/clientshell-releases"
  url "https://github.com/jiiro974/clientshell.git",
      tag:      "v2.1.0",
      revision: "446c79621c3cac4a2e5ee6e80129d6d32e2cb7fa"
  license "MIT"
  head "https://github.com/jiiro974/clientshell.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "-o", bin/"cs-toolbox", "./cmd/cs-toolbox/"
  end

  test do
    assert_match "cs-toolbox", shell_output("#{bin}/cs-toolbox version")
  end
end
