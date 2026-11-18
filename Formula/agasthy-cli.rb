class AgasthyCli < Formula
  desc "Read-only CLI and MCP server for AGASTHY developer machine intelligence"
  homepage "https://github.com/HMAKT99/Agasthy"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/HMAKT99/Agasthy/releases/download/v0.1.7/agasthy-cli-macos-aarch64.tar.gz"
      sha256 "37c14018418eb258e6749b2fd9c186398b241c8f615bac2f769e1b77590e94b0"
    end
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/HMAKT99/Agasthy/releases/download/v0.1.7/agasthy-cli-linux-x86_64.tar.gz"
      sha256 "6fa4a9e2c1b56f8567468d23110fccd2d9a144810beb567dc008c812edf4d25c"
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
