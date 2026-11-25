cask "safe-your-eyes" do
  arch arm: "arm64", intel: "x86_64"

  version "0.1.4"
  sha256 arm:   "c8257e38582a3fe070c7772e7eeb4ba31c4d60c5dec2cd80c827fd05fd6500f8",
         intel: "2561f50f9834b6401b67230cc5a1337f3145665d9860debe46b3a111fb53c811"

  url "https://github.com/tunglt1810/safe-your-eyes/releases/download/v#{version}/safe-your-eyes-macos-#{arch}.zip"
  name "Safe Your Eyes"
  desc "Lightweight cross-platform Rust eye-protection desktop app"
  homepage "https://tunglt1810.github.io/safe-your-eyes/"

  app "Safe Your Eyes.app"
  binary "#{appdir}/Safe Your Eyes.app/Contents/MacOS/safe-your-eyes"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Safe Your Eyes.app"]
  end

  zap trash: [
    "~/Library/Application Support/safe-your-eyes",
    "~/Library/Caches/safe-your-eyes",
    "~/Library/LaunchAgents/io.github.safeyoureyes.SafeYourEyes.plist",
  ]
end
