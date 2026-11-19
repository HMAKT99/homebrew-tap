class AgasthyCli < Formula
  desc "Read-only CLI and MCP server for AGASTHY developer machine intelligence"
  homepage "https://github.com/HMAKT99/Agasthy"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/HMAKT99/Agasthy/releases/download/v0.1.10/agasthy-cli-macos-universal.tar.gz"
      sha256 "88ad38a9cbd0baa03aa7f643eb581f76ad01dec167dea35ee034d953c509ba87"
    end

    on_intel do
      url "https://github.com/HMAKT99/Agasthy/releases/download/v0.1.10/agasthy-cli-macos-universal.tar.gz"
      sha256 "88ad38a9cbd0baa03aa7f643eb581f76ad01dec167dea35ee034d953c509ba87"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/HMAKT99/Agasthy/releases/download/v0.1.10/agasthy-cli-linux-x86_64.tar.gz"
      sha256 "44d6a7b8afa09c20b24e8fe3d2d04066ee5a198b7c30c794cef822a5d91c4d7c"
    end

    on_arm do
      url "https://github.com/HMAKT99/Agasthy/releases/download/v0.1.10/agasthy-cli-linux-aarch64.tar.gz"
      sha256 "f11c73a3878656c2c4f799319ebc059d4e12c641b3a69d066d17a12cc4879880"
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
