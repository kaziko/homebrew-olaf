class Olaf < Formula
  desc "Codebase context engine for Claude Code — MCP server for AI agents"
  homepage "https://github.com/kaziko/olaf-memory-context-engine"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kaziko/olaf-memory-context-engine/releases/download/v0.4.0/olaf-aarch64-apple-darwin"
      sha256 "2de52565620ed5d905f1c03f43d01508d55844963bba5437d82fe6f74220a3e2"
    else
      url "https://github.com/kaziko/olaf-memory-context-engine/releases/download/v0.4.0/olaf-x86_64-apple-darwin"
      sha256 "00c1f0fe71c96c6e4f0f5bc81eb88ae25e6796f6f1fa68c5723f085148b6bea3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kaziko/olaf-memory-context-engine/releases/download/v0.4.0/olaf-aarch64-unknown-linux-musl"
      sha256 "413a022bc1a339639f307aa7d1c5c4d1031115129757a1a519fd0a1b35012479"
    else
      url "https://github.com/kaziko/olaf-memory-context-engine/releases/download/v0.4.0/olaf-x86_64-unknown-linux-musl"
      sha256 "7f9b5cf047c25c63452a6ad1be3c99abc566723c4b411990e5d920fd65c0d828"
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
