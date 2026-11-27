cask "safe-your-eyes" do
  arch arm: "arm64", intel: "x86_64"

  version "0.2.2"
  sha256 arm:   "d2fa7e0786c74ab5f56cd7b5e17795fcf185976694506a9f94a7ed8c5705c72f",
         intel: "f25ef7cb06a8eb301f274d0d4f63fc21f26554cea9c05a7c8bb49692468e208e"

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
