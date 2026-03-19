class Clientshell < Formula
  desc "Secure workstation CLI for MSP/SOC teams with interactive shell"
  homepage "https://jiiro974.github.io/clientshell-releases"
  url "https://github.com/jiiro974/clientshell.git",
      tag:      "v2.1.0",
      revision: "0ce9a7db79ffdbbc747c15c9d4b86be2ed2e6162"
  license "MIT"
  head "https://github.com/jiiro974/clientshell.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "-o", bin/"clientshell", "./cmd/clientshell/"
    system "go", "build", *std_go_args(ldflags: "-s -w"), "-o", bin/"cs-toolbox", "./cmd/cs-toolbox/"
    system "go", "build", *std_go_args(ldflags: "-s -w"), "-o", bin/"cs-server", "./cmd/cs-server/"

    # Install shell completions (bash + zsh only, fish not supported)
    output = Utils.safe_popen_read(bin/"cs-toolbox", "completion", "bash")
    (bash_completion/"cs-toolbox").write output
    output = Utils.safe_popen_read(bin/"cs-toolbox", "completion", "zsh")
    (zsh_completion/"_cs-toolbox").write output
  end

  test do
    assert_match "ClientShell version", shell_output("#{bin}/clientshell version")
    assert_match "cs-toolbox", shell_output("#{bin}/cs-toolbox version")
  end
end
