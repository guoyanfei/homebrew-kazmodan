cask "omni-mind" do
  version "0.1.8"
  sha256 "c9c2be1c1611a98770fb93fcff90dbd3b97e644dc8821b61156cc9a2504f5895"

  # 阿里云 OSS 下载地址（由 release.sh 自动更新）
  url "https://yun2.kazmodan.com/target/omni-mind/OmniMind_0.1.8_aarch64.dmg"

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
