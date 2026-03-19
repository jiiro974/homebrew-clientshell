class CsServer < Formula
  desc "ClientShell central web server with REST API and WebSocket"
  homepage "https://jiiro974.github.io/clientshell-releases"
  url "https://github.com/jiiro974/clientshell.git",
      tag:      "v2.1.0",
      revision: "0ce9a7db79ffdbbc747c15c9d4b86be2ed2e6162"
  license "MIT"
  head "https://github.com/jiiro974/clientshell.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "-o", bin/"cs-server", "./cmd/cs-server/"
  end

  test do
    assert_match "cs-server", shell_output("#{bin}/cs-server --help 2>&1", 0)
  end
end
