cask "safe-your-eyes" do
  arch arm: "arm64", intel: "x86_64"

  version "0.2.0"
  sha256 arm:   "a750809823fca4cc001fe9460e436003ad5aa2bca2482e5363bd3d88f5d71586",
         intel: "71d15f598bbeeedf35b47cca5adb66991b0583a0901b93430a54814ab9b721b6"

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
