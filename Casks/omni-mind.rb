cask "omni-mind" do
  version "0.1.9"
  sha256 "ce81344f24adea1ec812ff1a2d65f582692c61fe53e59e2a3ebbd48bc20e8856"

  # 阿里云 OSS 下载地址（由 release.sh 自动更新）
  url "https://yun2.kazmodan.com/target/omni-mind/OmniMind_0.1.9_aarch64.dmg"

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
