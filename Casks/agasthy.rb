cask "agasthy" do
  version "0.1.5"
  sha256 "7949fbf9d7b25b9a33b9ab4cb22a29d38a11a2f233cd787cc1c43ebfea59de2f"

  url "https://github.com/HMAKT99/Agasthy/releases/download/v#{version}/AGASTHY-#{version}-apple-silicon.dmg"
  name "AGASTHY"
  desc "Developer machine intelligence: repos, runtimes, packages and coding agents"
  homepage "https://github.com/HMAKT99/Agasthy"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :monterey

  app "AGASTHY.app"

  zap trash: [
    "~/Library/Application Support/org.agasthy.desktop",
    "~/Library/Caches/org.agasthy.desktop",
    "~/Library/Preferences/org.agasthy.desktop.plist",
    "~/Library/Saved Application State/org.agasthy.desktop.savedState",
    "~/Library/WebKit/org.agasthy.desktop",
  ]
end
