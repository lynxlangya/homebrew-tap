cask "lexi" do
  version "2.1.3"
  sha256 "1041a299e7c7de265f7d2ca9986f2b6a677a3cffcb38814f4253dd7411daf3de"

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
