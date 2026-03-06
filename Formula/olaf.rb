class Olaf < Formula
  desc "Codebase context engine for Claude Code — MCP server for AI agents"
  homepage "https://github.com/kaziko/olaf-memory-context-engine"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kaziko/olaf-memory-context-engine/releases/download/v0.3.0/olaf-aarch64-apple-darwin"
      sha256 "62e78872f892dbb3b80dfc6298f586bc19c9b0270dd262eaadde0c552b61e994"
    else
      url "https://github.com/kaziko/olaf-memory-context-engine/releases/download/v0.3.0/olaf-x86_64-apple-darwin"
      sha256 "ed00949eecea1f1254f0fa99809386f3df15d18ac0f02387a38f9c2ed9414ba5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kaziko/olaf-memory-context-engine/releases/download/v0.3.0/olaf-aarch64-unknown-linux-musl"
      sha256 "9eb547767a364a3cda90d1a363f6d8dcbe83e719d5be7623146f131142352c6c"
    else
      url "https://github.com/kaziko/olaf-memory-context-engine/releases/download/v0.3.0/olaf-x86_64-unknown-linux-musl"
      sha256 "09fed269ca61094889310b8a650ad8abde144345dea752a526282ae15a01aa18"
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
