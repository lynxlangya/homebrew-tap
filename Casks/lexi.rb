cask "lexi" do
  version "2.0.1"
  sha256 "fe04bc95efa80c8f1c98c76591a80a31802f4d4d2a76b96d75a0ca7a8b4be63b"

  url "https://github.com/lynxlangya/lexi/releases/download/v#{version}/Lexi-#{version}-macos.zip"
  name "Lexi"
  desc "Bilingual reading and selection translation app"
  homepage "https://github.com/lynxlangya/lexi"

  depends_on macos: :tahoe

  app "Lexi.app"

  zap trash: [
    "~/Library/Application Support/Lexi",
    "~/Library/Preferences/com.langya.lexi.plist",
  ]

  caveats <<~EOS
    Lexi requires Accessibility permission for global selection translation.

    This MVP build is not Apple-notarized. If macOS blocks the first launch,
    allow it from System Settings -> Privacy & Security, or run:

      xattr -dr com.apple.quarantine /Applications/Lexi.app
      open /Applications/Lexi.app
  EOS
end
