cask "agasthy" do
  version "0.1.9"
  sha256 "678cfa5ba97984b3f364fe4261c8e4c592a3d7da708b47637dc681c9de09c3a3"

  url "https://github.com/HMAKT99/Agasthy/releases/download/v#{version}/AGASTHY-#{version}-macos-universal.dmg"
  name "AGASTHY"
  desc "Developer machine intelligence: repos, runtimes, packages and coding agents"
  homepage "https://github.com/HMAKT99/Agasthy"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :monterey

  app "AGASTHY.app"

  caveats <<~EOS
    AGASTHY is not notarized by Apple yet, so the first launch shows
    "Apple could not verify AGASTHY". Click Done, then open
    System Settings > Privacy & Security and click Open Anyway (once).
    Or install without the prompt:
      curl -fsSL https://raw.githubusercontent.com/HMAKT99/Agasthy/main/install.sh | sh
  EOS

  zap trash: [
    "~/Library/Application Support/org.agasthy.desktop",
    "~/Library/Caches/org.agasthy.desktop",
    "~/Library/Preferences/org.agasthy.desktop.plist",
    "~/Library/Saved Application State/org.agasthy.desktop.savedState",
    "~/Library/WebKit/org.agasthy.desktop",
  ]
end
