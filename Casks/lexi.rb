cask "lexi" do
  version "2.0.0"
  sha256 "aff6f90ce06578d4815e345a9dc41996486464d181f9ff669d76f209dfc258db"

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
