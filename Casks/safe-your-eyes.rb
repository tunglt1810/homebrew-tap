cask "safe-your-eyes" do
  arch arm: "arm64", intel: "x86_64"

  version "0.1.6"
  sha256 arm:   "18e72484ce523f7a85fd2efe528ad3f0bfb4f45f5bca593c61c7cd907369badb",
         intel: "f3d4db54f5092b9b6eba4b56465aa3ec570c57e7bfd28df5e157c775bd3a67f6"

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
