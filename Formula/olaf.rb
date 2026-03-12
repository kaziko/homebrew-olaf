class Olaf < Formula
  desc "Codebase context engine for Claude Code — MCP server for AI agents"
  homepage "https://github.com/kaziko/olaf-memory-context-engine"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kaziko/olaf-memory-context-engine/releases/download/v0.6.1/olaf-aarch64-apple-darwin"
      sha256 "5c14eb5f5ea4ab1b29e789445d990810da21635c91551b30dc32affce5b5ad23"
    else
      url "https://github.com/kaziko/olaf-memory-context-engine/releases/download/v0.6.1/olaf-x86_64-apple-darwin"
      sha256 "e2fb5b060838310f8cea8b9fa2c54ffb6b3aa32e1efb5d311aea29e2bd10f071"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kaziko/olaf-memory-context-engine/releases/download/v0.6.1/olaf-aarch64-unknown-linux-musl"
      sha256 "85410a453c9aa076ae5140835dc84aaf6e64c4d1a788304a588240199c57b1ef"
    else
      url "https://github.com/kaziko/olaf-memory-context-engine/releases/download/v0.6.1/olaf-x86_64-unknown-linux-musl"
      sha256 "f8f1a635ec421dea5c376aba261d39f41655bc81091b531bb2f12130d1829996"
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
