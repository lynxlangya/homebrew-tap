cask "lexi" do
  version "2.1.1"
  sha256 "cd7ce48c3b50265ae617c8f3154863aecd97912222627d68b0aeb5a27549a77b"

  url "https://github.com/lynxlangya/lexi/releases/download/v#{version}/Lexi-#{version}-macos.zip"
  name "Lexi"
  desc "Bilingual EPUB reader with AI read-aloud and selection translation"
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
