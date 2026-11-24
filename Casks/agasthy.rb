cask "agasthy" do
  version "0.1.11"
  sha256 "180dc485cdc8498a034ec6d15a2f0473234b69c9f569ec28e087f32fa9505769"

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

  zap trash: [
    "~/Library/Application Support/org.agasthy.desktop",
    "~/Library/Caches/org.agasthy.desktop",
    "~/Library/Preferences/org.agasthy.desktop.plist",
    "~/Library/Saved Application State/org.agasthy.desktop.savedState",
    "~/Library/WebKit/org.agasthy.desktop",
  ]

  caveats <<~EOS
    AGASTHY is not notarized by Apple yet, so the first launch shows
    "Apple could not verify AGASTHY". Click Done, then open
    System Settings > Privacy & Security and click Open Anyway (once).
    Or install without the prompt:
      curl -fsSL https://raw.githubusercontent.com/HMAKT99/Agasthy/main/install.sh | sh
  EOS
end
