class AgasthyCli < Formula
  desc "Read-only CLI and MCP server for AGASTHY developer machine intelligence"
  homepage "https://github.com/HMAKT99/Agasthy"
  version "0.1.5"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/HMAKT99/Agasthy/releases/download/v0.1.5/agasthy-cli-macos-aarch64.tar.gz"
    sha256 "b570e1a397ad70ef7b51afdb81916ce4c6dd62af855b9ca6959b539f8dd08aac"
    depends_on arch: :arm64
  end

  on_linux do
    url "https://github.com/HMAKT99/Agasthy/releases/download/v0.1.5/agasthy-cli-linux-x86_64.tar.gz"
    sha256 "0180202b6ddfdf7689f01d57e0ba2ef01de35783fbaed3782fe3701fa23578f7"
    depends_on arch: :x86_64
  end

  def install
    bin.install "agasthy"
  end

  def caveats
    <<~EOS
      Most queries read what the AGASTHY app has scanned:
        brew install --cask hmakt99/tap/agasthy
      Use it from coding agents with the MCP server:
        claude mcp add agasthy -- #{opt_bin}/agasthy mcp
    EOS
  end

  test do
    assert_match "agasthy #{version}", shell_output("#{bin}/agasthy --version")
    output = pipe_output("#{bin}/agasthy mcp",
      '{"jsonrpc":"2.0","id":1,"method":"tools/list"}' + "\n")
    assert_match "readOnlyHint", output
  end
end
