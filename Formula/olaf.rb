class Olaf < Formula
  desc "Codebase context engine for Claude Code — MCP server for AI agents"
  homepage "https://github.com/kaziko/olaf-memory-context-engine"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kaziko/olaf-memory-context-engine/releases/download/v0.2.0/olaf-aarch64-apple-darwin"
      sha256 "d0656fcda68cbf10527651e9e322faa8768aa4032875edb6c5e32ef7071eaeb5"
    else
      url "https://github.com/kaziko/olaf-memory-context-engine/releases/download/v0.2.0/olaf-x86_64-apple-darwin"
      sha256 "60e1c71c26e29c970ef3307e211346f2b2e04c87e182ea0723fc1ae1ab25671d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kaziko/olaf-memory-context-engine/releases/download/v0.2.0/olaf-aarch64-unknown-linux-musl"
      sha256 "6245ee701c91748485ba49a57fb15ab6e659cac447d4638d030c82de28ccbbef"
    else
      url "https://github.com/kaziko/olaf-memory-context-engine/releases/download/v0.2.0/olaf-x86_64-unknown-linux-musl"
      sha256 "1cecf3634be97cde7d0f6c6ec54cd9ae0853dd3dac88617a4c757f9089a9dad1"
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
