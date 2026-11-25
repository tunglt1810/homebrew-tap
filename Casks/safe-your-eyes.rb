cask "safe-your-eyes" do
  arch arm: "arm64", intel: "x86_64"

  version "0.1.5"
  sha256 arm:   "f98f2c3cf6f09e857ae1cf3e9bc84a76e77c317e201bece2b33a1e3b8a6338f0",
         intel: "a46e2a8faa37e1bbb4a52f7dc579e13b96c1b4ec50fcc738de8a3282e60c6ed5"

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
