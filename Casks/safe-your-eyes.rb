cask "safe-your-eyes" do
  arch arm: "arm64", intel: "x86_64"

  version "0.5.2"
  sha256 arm:   "a0c27bc1e98f519e5aab824cd0931491f0f63ae6edcb07ca0db15211fc2641af",
         intel: "6d3b6d1f5d0cb386d7a1405cfae5dde796508816ae30cb62d190b2f93d86e5a8"

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
