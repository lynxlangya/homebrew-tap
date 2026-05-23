# langya Homebrew Tap

**English** · [简体中文](#简体中文)

Personal Homebrew tap for macOS apps published by langya. This repository
contains installation recipes only; app source code and release assets stay in
their own product repositories.

## Install

Tap once:

```sh
brew tap lynxlangya/tap
```

Install Lexi:

```sh
brew install --cask lexi
```

Upgrade installed apps:

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
  README.md
```

Each app gets one cask under `Casks/`. The cask points to a versioned release
asset, usually a zip uploaded to that app's GitHub Releases page.

Current casks:

| Cask | Source | Artifact |
|---|---|---|
| `lexi` | [`lynxlangya/lexi`](https://github.com/lynxlangya/lexi) | `Lexi-<version>-macos.zip` |

## Add Or Update An App

1. Build the app in its source repository.
2. Package the `.app` bundle:

   ```sh
   ditto -c -k --sequesterRsrc --keepParent Lexi.app Lexi-2.0.0-macos.zip
   ```

3. Calculate the SHA-256 checksum:

   ```sh
   shasum -a 256 Lexi-2.0.0-macos.zip
   ```

4. Upload the zip file to the app repository's GitHub Release.
5. Add or update `Casks/<app>.rb` with the new `version`, `sha256`, and `url`.
6. Validate locally:

   ```sh
   brew style Casks/<app>.rb
   brew update
   brew install --cask <app>
   ```

7. Commit and push the cask update.

## Cask Template

```ruby
cask "app-name" do
  version "2.0.0"
  sha256 "<sha256>"

  url "https://github.com/owner/repo/releases/download/v#{version}/App-#{version}-macos.zip"
  name "App Name"
  desc "Short product description without the platform name"
  homepage "https://github.com/owner/repo"

  depends_on macos: :tahoe

  app "App Name.app"

  zap trash: [
    "~/Library/Application Support/App Name",
    "~/Library/Preferences/com.example.app.plist",
  ]
end
```

## Signing And Notarization

Homebrew is a distribution channel. It does not replace macOS code signing or
Apple notarization.

Unsigned or ad-hoc signed builds are acceptable for small technical preview
groups, but macOS may block the first launch. Public releases should eventually
use a Developer ID certificate and Apple notarization.

---

## 简体中文

这是 langya 个人使用的 Homebrew tap，用来分发 macOS App。这个仓库只保存安装配方；
每个 App 的源码和 release 安装包仍然放在各自的产品仓库里。

## 安装

第一次先添加 tap：

```sh
brew tap lynxlangya/tap
```

安装 Lexi：

```sh
brew install --cask lexi
```

后续升级：

```sh
brew update
brew upgrade --cask lexi
```

## 仓库结构

```text
homebrew-tap/
  Casks/
    lexi.rb
    another-app.rb
  README.md
```

每个 App 在 `Casks/` 下对应一个 cask 文件。cask 指向该 App 自己 GitHub Releases
里的版本化安装包。

当前 cask：

| Cask | 源码仓库 | 安装包 |
|---|---|---|
| `lexi` | [`lynxlangya/lexi`](https://github.com/lynxlangya/lexi) | `Lexi-<version>-macos.zip` |

## 新增或更新 App

1. 在 App 自己的源码仓库里构建 release 版本。
2. 打包 `.app`：

   ```sh
   ditto -c -k --sequesterRsrc --keepParent Lexi.app Lexi-2.0.0-macos.zip
   ```

3. 计算 SHA-256：

   ```sh
   shasum -a 256 Lexi-2.0.0-macos.zip
   ```

4. 把 zip 上传到对应 App 的 GitHub Release。
5. 更新 `Casks/<app>.rb` 的 `version`、`sha256` 和 `url`。
6. 本地验证：

   ```sh
   brew style Casks/<app>.rb
   brew update
   brew install --cask <app>
   ```

7. 提交并推送 cask 更新。

## 签名与 notarization

Homebrew 只负责分发，不能替代 macOS 代码签名和 Apple notarization。

未签名或 ad-hoc 签名的构建包可以用于小范围技术预览，但 macOS 首次打开时可能会拦截。
面向普通用户公开发布时，仍然应该使用 Developer ID 证书并通过 Apple notarization。
