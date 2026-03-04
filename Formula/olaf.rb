class Olaf < Formula
  desc "Codebase context engine for Claude Code — MCP server for AI agents"
  homepage "https://github.com/kaziko/olaf-memory-context-engine"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kaziko/olaf-memory-context-engine/releases/download/v0.1.0/olaf-aarch64-apple-darwin"
      sha256 "e6c5518ab4ce70078611848b3381013a138b711c6478ea30b62ab34d5f509086"
    else
      url "https://github.com/kaziko/olaf-memory-context-engine/releases/download/v0.1.0/olaf-x86_64-apple-darwin"
      sha256 "f36a2cf035ad1cae0ab98428d6729c3f6927d142597b73ffb95964b0b0c2c9ea"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kaziko/olaf-memory-context-engine/releases/download/v0.1.0/olaf-aarch64-unknown-linux-musl"
      sha256 "0b590d1c1585b3a168d23c29bbce9d43361524ca3b0d9c761d4038085c170a42"
    else
      url "https://github.com/kaziko/olaf-memory-context-engine/releases/download/v0.1.0/olaf-x86_64-unknown-linux-musl"
      sha256 "02ceb6ecd2fed9648bc297dce61d713fa93feb24e36c984a55eedd591d5ded07"
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
