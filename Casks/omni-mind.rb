cask "omni-mind" do
  version "0.1.11"
  sha256 "c4d1c088a1e4d40f4c0e24a406748b838b362144abc9e0897a3a90991131a3ae"

  # 阿里云 OSS 下载地址（由 release.sh 自动更新）
  url ""

  name "OmniMind"
  desc "个人全景管理系统 - Tauri 桌面应用"
  homepage "https://gitea.kazmodan.com/guoyanfei/omni-mind"

  # 仅支持 Apple Silicon (M1/M2/M3)
  depends_on macos: ">= :big_sur"
  depends_on arch: :arm64

  app "OmniMind.app"

  # 安装后移除隔离属性（避免"已损坏"提示）
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/OmniMind.app"],
                   sudo: false
  end

  # 卸载时的清理
  zap trash: [
    "~/Library/Application Support/com.kazmodan.omni-mind",
    "~/Library/Caches/com.kazmodan.omni-mind",
    "~/Library/HTTPStorages/com.kazmodan.omni-mind",
    "~/Library/Preferences/com.kazmodan.omni-mind.plist",
    "~/Library/Saved Application State/com.kazmodan.omni-mind.savedState",
  ]
end
