cask "mcpmux" do
  arch arm: "aarch64", intel: "x64"

  version "0.4.0"
  sha256 arm:   "b73bf51f3df461fa511717330332ef6ed2295f7cb8af73f4141274268d0b1c76",
         intel: "fc4134c2017a680fa8d0c2697517c0a74d9276976b74c264cded0a370e8e9b17"

  url "https://github.com/mcpmux/mcp-mux/releases/download/v#{version}/McpMux_#{version}_#{arch}.dmg",
      verified: "github.com/mcpmux/mcp-mux/"

  name "McpMux"
  desc "Unified MCP gateway and manager for AI clients"
  homepage "https://mcpmux.com"


  livecheck do
    url "https://github.com/mcpmux/mcp-mux/releases/latest"
    strategy :github_latest
  end

  app "McpMux.app"

  # Remove quarantine for ad-hoc signed app (no Apple Developer ID)
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/McpMux.app"]
  end

  zap trash: [
    "~/Library/Application Support/com.mcpmux.desktop",
    "~/Library/Preferences/com.mcpmux.desktop.plist",
    "~/Library/Caches/com.mcpmux.desktop",
    "~/Library/Saved Application State/com.mcpmux.desktop.savedState",
  ]
end
