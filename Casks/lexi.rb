cask "lexi" do
  version "2.1.2"
  sha256 "bad759513d6ef047a2eef452a3abd7421b82523911dc84cbd687d03ab283d1c4"

  url "https://pub-971ee03b82ad411a9bb26c62a06ca755.r2.dev/lexi/releases/#{version}/Lexi-#{version}-installer.dmg",
      verified: "pub-971ee03b82ad411a9bb26c62a06ca755.r2.dev/lexi/releases/"
  name "Lexi"
  desc "Bilingual EPUB reader with AI read-aloud and selection translation"
  homepage "https://lexi.wangyun.fan/"

  depends_on macos: :tahoe

  app "Lexi.app"

  zap trash: [
    "~/Library/Application Support/Lexi",
    "~/Library/Preferences/com.langya.lexi.plist",
  ]

  caveats <<~EOS
    Lexi requires Accessibility permission for global selection translation.
  EOS
end
