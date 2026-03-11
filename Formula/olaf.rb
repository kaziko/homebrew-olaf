class Olaf < Formula
  desc "Codebase context engine for Claude Code — MCP server for AI agents"
  homepage "https://github.com/kaziko/olaf-memory-context-engine"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kaziko/olaf-memory-context-engine/releases/download/v0.6.0/olaf-aarch64-apple-darwin"
      sha256 "bc4a4e477a90593691a5a43b545baff0a772dba121f20a2460ceaff8570a65d0"
    else
      url "https://github.com/kaziko/olaf-memory-context-engine/releases/download/v0.6.0/olaf-x86_64-apple-darwin"
      sha256 "ee3b604e3df0593ce36e7a80ad10dbb458d2bfade2777722293da6580ebe6602"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kaziko/olaf-memory-context-engine/releases/download/v0.6.0/olaf-aarch64-unknown-linux-musl"
      sha256 "5c408e58c93aef6143a9b8de533210d6d6bf5e0edaf306ce958b2eddbe21f657"
    else
      url "https://github.com/kaziko/olaf-memory-context-engine/releases/download/v0.6.0/olaf-x86_64-unknown-linux-musl"
      sha256 "92ad1bbe9669acb6dfb9de696081ff416b0078487ab3eedd50dca1dec1144f59"
    end
  end

  def install
    # Deterministic: construct filename from known arch/platform constants.
    # Never use Dir["olaf-*"].first — non-deterministic if >1 file matches.
    arch = Hardware::CPU.arm? ? "aarch64" : "x86_64"
    platform = OS.mac? ? "apple-darwin" : "unknown-linux-musl"
    bin.install "olaf-#{arch}-#{platform}" => "olaf"
  end

  test do
    system bin/"olaf", "--help"
  end
end
