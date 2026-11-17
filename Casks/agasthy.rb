cask "agasthy" do
  version "0.1.6"
  sha256 "c020247b54182a2200f895ba9a818170c215ba0e6945d19f5fa3f29f63d6415f"

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
