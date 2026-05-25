cask "lexi" do
  version "2.1.0"
  sha256 "7b0d8b04738a50455f7e194c7ff22bb82a0b950b4308fe6771ca74fdb6f5cc77"

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
