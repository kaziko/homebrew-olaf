class Olaf < Formula
  desc "Codebase context engine for Claude Code — MCP server for AI agents"
  homepage "https://github.com/kaziko/olaf-memory-context-engine"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kaziko/olaf-memory-context-engine/releases/download/v0.5.0/olaf-aarch64-apple-darwin"
      sha256 "d82dc7c8b4d140812a070608c76c1ce810f1db1b892391157f1414ec04720603"
    else
      url "https://github.com/kaziko/olaf-memory-context-engine/releases/download/v0.5.0/olaf-x86_64-apple-darwin"
      sha256 "d6abb4e21aabfc2ee7710efdb14cc2d8b45188336b24435c31d478e70e055070"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kaziko/olaf-memory-context-engine/releases/download/v0.5.0/olaf-aarch64-unknown-linux-musl"
      sha256 "8ca7f31a05ca2a637aa286fa19407774b4efc73a0130c01f67ced98b0a58bd41"
    else
      url "https://github.com/kaziko/olaf-memory-context-engine/releases/download/v0.5.0/olaf-x86_64-unknown-linux-musl"
      sha256 "f037e5db880c4b813906673ec23119e8ad0be5857f70f6157facb8422fca07ca"
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
