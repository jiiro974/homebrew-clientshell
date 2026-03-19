class CsToolbox < Formula
  desc "70+ SOC/security diagnostic tools for MSP teams"
  homepage "https://jiiro974.github.io/clientshell-releases"
  url "https://github.com/jiiro974/clientshell.git",
      tag:      "v2.2.1",
      revision: "9d19e2251cd21d60b80796bb8d429d13ab6b4919"
  license "MIT"
  head "https://github.com/jiiro974/clientshell.git", branch: "main"

  depends_on "go" => :build

  def install
    ldflags = "-s -w -X main.version=#{version}"
    system "go", "build", *std_go_args(ldflags: ldflags), "-o", bin/"cs-toolbox", "./cmd/cs-toolbox/"
  end

  test do
    assert_match "cs-toolbox", shell_output("#{bin}/cs-toolbox version")
  end
end
