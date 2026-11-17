class AgasthyCli < Formula
  desc "Read-only CLI and MCP server for AGASTHY developer machine intelligence"
  homepage "https://github.com/HMAKT99/Agasthy"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/HMAKT99/Agasthy/releases/download/v0.1.6/agasthy-cli-macos-aarch64.tar.gz"
      sha256 "54db3f4e3eaf42a2a1f94c5d74a63b2b4e5b3d289efa2d15f31f7206b3fa6785"
    end
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/HMAKT99/Agasthy/releases/download/v0.1.6/agasthy-cli-linux-x86_64.tar.gz"
      sha256 "78a4a9854306f7c1dadbf4f3cdbeaa5b65aff9e0baecd6ecb929d9d6df334704"
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
