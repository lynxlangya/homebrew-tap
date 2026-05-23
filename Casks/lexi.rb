cask "lexi" do
  version "1.2.0"
  sha256 "989fa91ea20acc368f7b66efde623ded6b975bc9de8f3860dba44ab968cad575"

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
