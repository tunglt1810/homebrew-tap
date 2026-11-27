cask "safe-your-eyes" do
  arch arm: "arm64", intel: "x86_64"

  version "0.3.0"
  sha256 arm:   "f6e3134dac1049e1e47325089f49b9283b87269bd49b2432c2e6b04abcc652b5",
         intel: "82b0866cfeb151822d9bc93c4d35853045a1b31ee93c8ff787e8c1b2e9148a6b"

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
