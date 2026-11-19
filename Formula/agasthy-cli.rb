class AgasthyCli < Formula
  desc "Read-only CLI and MCP server for AGASTHY developer machine intelligence"
  homepage "https://github.com/HMAKT99/Agasthy"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/HMAKT99/Agasthy/releases/download/v0.1.9/agasthy-cli-macos-universal.tar.gz"
    sha256 "34bc12ad5ba783dc84531996e98f34f0d47eddb9aecf60b611b5351ea34b9e3f"
  end

  on_linux do
    on_intel do
      url "https://github.com/HMAKT99/Agasthy/releases/download/v0.1.9/agasthy-cli-linux-x86_64.tar.gz"
      sha256 "4627c743265a94a8a3da0a025c247475a632bc5444d1b24bb217effd5ef35ed5"
    end

    on_arm do
      url "https://github.com/HMAKT99/Agasthy/releases/download/v0.1.9/agasthy-cli-linux-aarch64.tar.gz"
      sha256 "69fb11ae96ef97d127011c016e00d4b21cd55bf56cb88a5344703d62dc895eaa"
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
