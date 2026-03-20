class CsGateway < Formula
  desc "ClientShell Gateway — Cortex XSIAM/XSOAR reverse proxy"
  homepage "https://github.com/jiiro974/clientshell"
  url "https://github.com/jiiro974/clientshell.git",
      tag:      "v2.5.0",
      revision: "5ab9563bb45097ea475d86ec95214d389ba150a6"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "-o", bin/"cs-gateway", "./cmd/cs-gateway/"
  end

  test do
    assert_match "ok", shell_output("#{bin}/cs-gateway --help 2>&1", 0)
  end
end
