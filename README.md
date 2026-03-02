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
# 安装 OmniMind（--no-quarantine 避免 macOS "已损坏"提示）
brew install --cask --no-quarantine omni-mind
```

### 更新应用

```bash
brew upgrade --cask --no-quarantine omni-mind
```

### 卸载应用

```bash
brew uninstall --cask omni-mind
```

### 移除 Tap

```bash
brew untap guoyanfei/kazmodan
```
