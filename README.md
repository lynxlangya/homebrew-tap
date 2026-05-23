# langya Homebrew Tap

Personal Homebrew tap for macOS apps published by langya.

This repository stores Homebrew Cask formulas only. App source code and release
artifacts should stay in each product repository.

## Install

```sh
brew tap lynxlangya/tap
brew install --cask lexi
```

Upgrade later with:

```sh
brew update
brew upgrade --cask lexi
```

## Repository Layout

```text
homebrew-tap/
  Casks/
    lexi.rb
    another-app.rb
```

Each cask points to a downloadable release asset, usually a zip file uploaded to
the source repository's GitHub Releases page.

Example release asset URL:

```text
https://github.com/lynxlangya/lexi/releases/download/v0.1.0/Lexi-0.1.0-macos.zip
```

## Publishing Flow

1. Build the macOS app from its source repository.
2. Package the `.app` bundle:

   ```sh
   ditto -c -k --sequesterRsrc --keepParent Lexi.app Lexi-0.1.0-macos.zip
   ```

3. Calculate the SHA-256 checksum:

   ```sh
   shasum -a 256 Lexi-0.1.0-macos.zip
   ```

4. Upload the zip file to the app repository's GitHub Release.
5. Add or update `Casks/<app>.rb` in this tap with the new `version`, `sha256`,
   and `url`.
6. Validate locally:

   ```sh
   brew audit --cask --new lexi
   brew install --cask --verbose ./Casks/lexi.rb
   ```

7. Commit and push the cask update.

## Cask Template

```ruby
cask "lexi" do
  version "0.1.0"
  sha256 "<sha256>"

  url "https://github.com/lynxlangya/lexi/releases/download/v#{version}/Lexi-#{version}-macos.zip"
  name "Lexi"
  desc "macOS bilingual reading and selection translation app"
  homepage "https://github.com/lynxlangya/lexi"

  app "Lexi.app"

  zap trash: [
    "~/Library/Application Support/Lexi",
    "~/Library/Preferences/com.langya.lexi.plist",
  ]

  caveats <<~EOS
    Lexi requires Accessibility permission for global selection translation.

    If this build is not notarized and macOS blocks it, open it once with:
      xattr -dr com.apple.quarantine /Applications/Lexi.app
      open /Applications/Lexi.app
  EOS
end
```

## Signing And Notarization

Homebrew is only the distribution channel. It does not replace macOS code
signing or Apple notarization.

For a public, low-friction installation experience, each app should eventually
be signed with a Developer ID certificate and notarized by Apple. Unsigned or
non-notarized builds are acceptable only for small technical dogfood groups, and
users may need to approve the app manually in macOS security settings.

