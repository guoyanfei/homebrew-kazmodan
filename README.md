# Kazmodan Homebrew Tap

Kazmodan 软件仓库，通过 Homebrew 安装应用。

## 可用软件

| 软件 | 描述 |
|------|------|
| omnimind | 个人全景管理系统 - Tauri 桌面应用 |

## 使用方法

### 添加 Tap

```bash
brew tap kazmodan/kazmodan https://github.com/guoyanfei/homebrew-kazmodan.git
```

### 安装应用

```bash
# 安装 OmniMind
brew install --cask omnimind

# 安装其他应用
# brew install --cask <app-name>
```

### 更新应用

```bash
brew upgrade --cask omnimind
```

### 卸载应用

```bash
brew uninstall --cask omnimind
```

### 移除 Tap

```bash
brew untap kazmodan/kazmodan
```

## 发布新版本

1. 构建新的 dmg 文件：
   ```bash
   npm run tauri build
   ```

2. 计算 SHA256：
   ```bash
   shasum -a 256 src-tauri/target/release/bundle/dmg/OmniMind_X.X.X_aarch64.dmg
   ```

3. 上传 dmg 到发布服务器（Gitea Releases / GitHub Releases / 自托管服务器）

4. 更新 `Casks/omnimind.rb`：
   - 修改 `version`
   - 修改 `sha256`
   - 修改 `url`（如果下载地址变化）

5. 提交并推送更新：
   ```bash
   git add Casks/omnimind.rb
   git commit -m "omnimind: bump version to X.X.X"
   git push
   ```

## 添加新软件

1. 在 `Casks/` 目录下创建新的 `.rb` 文件

2. 使用模板：
   ```ruby
   cask "your-app" do
     version "X.X.X"
     sha256 "YOUR_SHA256_HASH"

     url "https://your-download-url/#{version}/YourApp_#{version}_aarch64.dmg"
     name "Your App Name"
     desc "App description"
     homepage "https://your-homepage"

     depends_on macos: ">= :big_sur"
     depends_on arch: :arm64

     app "YourApp.app"

     zap trash: [
       "~/Library/Application Support/com.your.app",
       "~/Library/Caches/com.your.app",
     ]
   end
   ```

3. 更新本 README 中的软件列表

## 本地测试

```bash
# 审计 Cask 文件
brew audit --cask Casks/omnimind.rb

# 本地安装测试
brew install --cask Casks/omnimind.rb

# 样式检查
brew style Casks/omnimind.rb
```
