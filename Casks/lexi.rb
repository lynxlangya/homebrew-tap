cask "lexi" do
  version "2.1.1"
  sha256 "2d94dd3efe40324fe0107ea44b01cfb2b76e2b5e4a29ebc3b653cd1dddddf4ad"

  url "https://pub-971ee03b82ad411a9bb26c62a06ca755.r2.dev/lexi/releases/#{version}/Lexi-#{version}-installer.dmg",
      verified: "pub-971ee03b82ad411a9bb26c62a06ca755.r2.dev/lexi/releases/"
  name "Lexi"
  desc "Bilingual EPUB reader with AI read-aloud and selection translation"
  homepage "https://lexi.wangyun.fan"

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
