# Kazmodan Homebrew Tap

Kazmodan 软件仓库，通过 Homebrew 安装应用。

## 可用软件

| 软件 | 描述 |
|------|------|
| omni-mind | 个人全景管理系统 - Tauri 桌面应用 |

## 使用方法

### 添加 Tap

```bash
brew tap kazmodan/kazmodan https://github.com/guoyanfei/homebrew-kazmodan.git
```

### 安装应用

```bash
# 安装 OmniMind
brew install --cask omni-mind
```

### 更新应用

```bash
brew upgrade --cask omni-mind
```

### 卸载应用

```bash
brew uninstall --cask omni-mind
```

### 移除 Tap

```bash
brew untap kazmodan/kazmodan
```

## 发布新版本

### 方式1：使用自动化脚本（推荐）

在 omni-mind 项目根目录运行：

```bash
# patch 版本更新（0.1.0 -> 0.1.1）
./release.sh patch

# minor 版本更新（0.1.0 -> 0.2.0）
./release.sh minor

# major 版本更新（0.1.0 -> 1.0.0）
./release.sh major
```

脚本会自动完成：
1. 更新 package.json 和 tauri.conf.json 版本号
2. 构建 dmg
3. 计算 SHA256
4. 上传到阿里云 OSS
5. 更新本仓库的 Cask 文件
6. 推送到 GitHub

### 方式2：手动发布

1. 构建新的 dmg 文件：
   ```bash
   npm run tauri build
   ```

2. 计算 SHA256：
   ```bash
   shasum -a 256 src-tauri/target/release/bundle/dmg/OmniMind_X.X.X_aarch64.dmg
   ```

3. 上传 dmg 到阿里云 OSS

4. 更新 `Casks/omni-mind.rb`：
   - 修改 `version`
   - 修改 `sha256`

5. 提交并推送更新：
   ```bash
   cd ~/Documents/personal/code/homebrew-kazmodan
   git add Casks/omni-mind.rb
   git commit -m "omni-mind: bump version to X.X.X"
   git push
   ```

## 添加新软件

1. 在 `Casks/` 目录下创建新的 `.rb` 文件

2. 使用模板：
   ```ruby
   cask "your-app" do
     version "X.X.X"
     sha256 "YOUR_SHA256_HASH"

     url "https://your-bucket.oss-cn-hangzhou.aliyuncs.com/path/YourApp_#{version}_aarch64.dmg"
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
brew audit --cask Casks/omni-mind.rb

# 本地安装测试
brew install --cask Casks/omni-mind.rb

# 样式检查
brew style Casks/omni-mind.rb
```
