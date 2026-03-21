class Olaf < Formula
  desc "Codebase context engine for Claude Code — MCP server for AI agents"
  homepage "https://github.com/kaziko/olaf-memory-context-engine"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kaziko/olaf-memory-context-engine/releases/download/v0.7.0/olaf-aarch64-apple-darwin"
      sha256 "dc56e43caf12f60707180b3780f4fd444e1892be6f6919364af7e6013acf3aea"
    else
      url "https://github.com/kaziko/olaf-memory-context-engine/releases/download/v0.7.0/olaf-x86_64-apple-darwin"
      sha256 "5b944250cd1724ac996465b1cca68b9e21006f9dde86f83c4fee6b3022b0935f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kaziko/olaf-memory-context-engine/releases/download/v0.7.0/olaf-aarch64-unknown-linux-musl"
      sha256 "7268c0adc3c0df09cab74da0e869b6d116c1587b786668de4966c9fef6550261"
    else
      url "https://github.com/kaziko/olaf-memory-context-engine/releases/download/v0.7.0/olaf-x86_64-unknown-linux-musl"
      sha256 "7cff0e97a0bfab22a15473a095cfa0604634598baf960d0ac01461c46b00fdeb"
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
