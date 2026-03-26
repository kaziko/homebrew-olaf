class Olaf < Formula
  desc "Codebase context engine for Claude Code — MCP server for AI agents"
  homepage "https://github.com/kaziko/olaf-memory-context-engine"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kaziko/olaf-memory-context-engine/releases/download/v0.7.1/olaf-aarch64-apple-darwin"
      sha256 "070c63ed814621492b7303ebab1d321bf125bf1248548ad49b36ca5e3da48db8"
    else
      url "https://github.com/kaziko/olaf-memory-context-engine/releases/download/v0.7.1/olaf-x86_64-apple-darwin"
      sha256 "bf6b6a4d984309b8c369b4292fb259e48604dafce8709fd4f91f08b4a81b8815"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kaziko/olaf-memory-context-engine/releases/download/v0.7.1/olaf-aarch64-unknown-linux-musl"
      sha256 "e9ee79602bdc1ead30537923b731710af7ec96ef44781be17b6811cfcb12beb0"
    else
      url "https://github.com/kaziko/olaf-memory-context-engine/releases/download/v0.7.1/olaf-x86_64-unknown-linux-musl"
      sha256 "e089545f4aa968417f265f999b3e03cec1f26bbf73ad0ca8f1b25d19e66763ad"
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
