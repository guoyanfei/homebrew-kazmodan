cask "omnimind" do
  version "0.1.0"
  sha256 "c6d4b38fab3d4977633a8ecbcb463afe0ede9d86029e517972ce41193e0b03a3"

  # TODO: 替换为实际的下载地址
  # GitHub Releases (推荐)
  # url "https://github.com/YOUR_USERNAME/omni-mind/releases/download/v#{version}/OmniMind_#{version}_aarch64.dmg"

  # Gitea Releases
  # url "https://gitea.kazmodan.com/guoyanfei/omni-mind/releases/download/v#{version}/OmniMind_#{version}_aarch64.dmg"

  # 自托管服务器
  # url "https://your-server.com/downloads/OmniMind_#{version}_aarch64.dmg"

  # 本地测试用
  url "file:///Users/guoyanfei/Documents/personal/code/omni-mind/src-tauri/target/release/bundle/dmg/OmniMind_#{version}_aarch64.dmg"

  name "OmniMind"
  desc "个人全景管理系统 - Tauri 桌面应用"
  homepage "https://gitea.kazmodan.com/guoyanfei/omni-mind"

  # 仅支持 Apple Silicon (M1/M2/M3)
  depends_on macos: ">= :big_sur"
  depends_on arch: :arm64

  app "OmniMind.app"

  # 卸载时的清理
  zap trash: [
    "~/Library/Application Support/com.kazmodan.omni-mind",
    "~/Library/Caches/com.kazmodan.omni-mind",
    "~/Library/HTTPStorages/com.kazmodan.omni-mind",
    "~/Library/Preferences/com.kazmodan.omni-mind.plist",
    "~/Library/Saved Application State/com.kazmodan.omni-mind.savedState",
  ]
end
