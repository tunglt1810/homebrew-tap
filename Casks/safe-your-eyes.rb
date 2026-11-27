cask "safe-your-eyes" do
  arch arm: "arm64", intel: "x86_64"

  version "0.5.1"
  sha256 arm:   "e237403c89b34cdaa8dc0a7ae5ca173a471a790986e36c7c3532745241504773",
         intel: "36eea538c7728c1182b55f2ee06d3ab63a1b499fcffb6de9b992ce7963a2fc1c"

  url "https://github.com/tunglt1810/safe-your-eyes/releases/download/v#{version}/safe-your-eyes-macos-#{arch}.zip"
  name "Safe Your Eyes"
  desc "Lightweight cross-platform Rust eye-protection desktop app"
  homepage "https://tunglt1810.github.io/safe-your-eyes/"

  app "Safe Your Eyes.app"
  binary "#{appdir}/Safe Your Eyes.app/Contents/MacOS/safe-your-eyes"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Safe Your Eyes.app"]
  end

  uninstall quit: "io.github.safeyoureyes.SafeYourEyes"

  zap trash: [
    "~/Library/Application Support/safe-your-eyes",
    "~/Library/Caches/safe-your-eyes",
    "~/Library/LaunchAgents/io.github.safeyoureyes.SafeYourEyes.plist",
  ]
end
