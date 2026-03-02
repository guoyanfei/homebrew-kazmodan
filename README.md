# Kazmodan Homebrew Tap

Kazmodan 软件仓库，通过 Homebrew 安装应用。

## 可用软件

| 软件 | 描述 |
|------|------|
| omni-mind | 个人全景管理系统 - Tauri 桌面应用 |

## 使用方法

### 添加 Tap

```bash
brew tap guoyanfei/kazmodan
```

### 安装应用

```bash
# 安装 OmniMind
brew install --cask omni-mind
```

> **注意**：首次打开若提示"已损坏"，请在终端运行：
> ```bash
> xattr -cr /Applications/OmniMind.app
> ```

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
brew untap guoyanfei/kazmodan
```
