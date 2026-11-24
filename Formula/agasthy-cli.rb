class AgasthyCli < Formula
  desc "Read-only CLI and MCP server for AGASTHY developer machine intelligence"
  homepage "https://github.com/HMAKT99/Agasthy"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/HMAKT99/Agasthy/releases/download/v0.1.11/agasthy-cli-macos-universal.tar.gz"
      sha256 "3330700b61a0d6ae01b499b8e51896a0106df6d956a0fc040f2e46221d4265c1"
    end

    on_intel do
      url "https://github.com/HMAKT99/Agasthy/releases/download/v0.1.11/agasthy-cli-macos-universal.tar.gz"
      sha256 "3330700b61a0d6ae01b499b8e51896a0106df6d956a0fc040f2e46221d4265c1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/HMAKT99/Agasthy/releases/download/v0.1.11/agasthy-cli-linux-x86_64.tar.gz"
      sha256 "072372efcb95851f1bb9c472f90366b7fa706edaf998636bdcb85ffce684aefb"
    end

    on_arm do
      url "https://github.com/HMAKT99/Agasthy/releases/download/v0.1.11/agasthy-cli-linux-aarch64.tar.gz"
      sha256 "727ca49f8f249e0519e7eb2917e13f9ea58a3985d23ac3f62c29044610fe6c60"
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
