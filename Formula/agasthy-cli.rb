class AgasthyCli < Formula
  desc "Read-only CLI and MCP server for AGASTHY developer machine intelligence"
  homepage "https://github.com/HMAKT99/Agasthy"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/HMAKT99/Agasthy/releases/download/v0.1.8/agasthy-cli-macos-aarch64.tar.gz"
      sha256 "2d74f44e7bd169064b959a86d6294e8925c3ab360766c04187b151648fab5b19"
    end
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/HMAKT99/Agasthy/releases/download/v0.1.8/agasthy-cli-linux-x86_64.tar.gz"
      sha256 "2b5986ade74de64cde79e694941047c98d84d3208aaefc46edc95fe734c52ac1"
    end
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
