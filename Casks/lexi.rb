cask "lexi" do
  version "2.1.1"
  sha256 "b8403129a50840c80073b3dcd1ce5383f7891c544082cdbd4bdf08f6b98e26b1"

  url "https://pub-971ee03b82ad411a9bb26c62a06ca755.r2.dev/lexi/releases/#{version}/Lexi-#{version}-notarized.zip"
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
