cask "safe-your-eyes" do
  arch arm: "arm64", intel: "x86_64"

  version "0.4.0"
  sha256 arm:   "84a8dad67783b480f2ca8ce6c494ffb03f9b41fa771d5d9dad5c004cddbe09ac",
         intel: "ab0c2d624778364bd2f8d5d5bc268e1538ac591ed0ea4db5bcbe204715af1aaf"

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
