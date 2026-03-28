class Olaf < Formula
  desc "Codebase context engine for Claude Code — MCP server for AI agents"
  homepage "https://github.com/kaziko/olaf-memory-context-engine"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kaziko/olaf-memory-context-engine/releases/download/v0.7.2/olaf-aarch64-apple-darwin"
      sha256 "d777b0685816f619ead79ac57a2f3f07b797e6bb5bd93df5fd7a58cda22f9d6e"
    else
      url "https://github.com/kaziko/olaf-memory-context-engine/releases/download/v0.7.2/olaf-x86_64-apple-darwin"
      sha256 "e71c4685e2a3048c91ef8da868cb33f33c9392f32cfa76c05c9bacd32509ec40"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kaziko/olaf-memory-context-engine/releases/download/v0.7.2/olaf-aarch64-unknown-linux-musl"
      sha256 "43c8d67ce53ad799c7221051a811b06a1e2984092f5be8dc8b89c5f0a338bc61"
    else
      url "https://github.com/kaziko/olaf-memory-context-engine/releases/download/v0.7.2/olaf-x86_64-unknown-linux-musl"
      sha256 "a72148a36dbc7a93af8c85adc7ddac36f8ef410d0c240c270f75bd0ec65da2c8"
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
