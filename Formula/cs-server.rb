class CsServer < Formula
  desc "ClientShell central web server with REST API and WebSocket"
  homepage "https://jiiro974.github.io/clientshell-releases"
  url "https://github.com/jiiro974/clientshell.git",
      tag:      "v2.4.0",
      revision: "ad62bbbe5e45f001f794b243b8788d1bdde323b4"
  license "MIT"
  head "https://github.com/jiiro974/clientshell.git", branch: "main"

  depends_on "go" => :build

  def install
    ldflags = "-s -w -X main.version=#{version}"
    system "go", "build", *std_go_args(ldflags: ldflags), "-o", bin/"cs-server", "./cmd/cs-server/"
  end

  test do
    assert_match "cs-server", shell_output("#{bin}/cs-server --help 2>&1", 0)
  end
end
