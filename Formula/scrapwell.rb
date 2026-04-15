class Scrapwell < Formula
  desc "MCP memory server for LLM agents"
  homepage "https://github.com/argonism/scrapwell"
  version "0.1.1"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/argonism/scrapwell/releases/download/v0.1.1/scrapwell-aarch64-apple-darwin.tar.xz"
      sha256 "4558b41f8ccb08737b623d10753adfa365a0f592baa008028672d638aa982ba6"
    end
    if Hardware::CPU.intel?
      url "https://github.com/argonism/scrapwell/releases/download/v0.1.1/scrapwell-x86_64-apple-darwin.tar.xz"
      sha256 "5253c7ff355a2c7918afb8ea6289e83cbfa7399ad053b2dde22d59e5135ecc4c"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/argonism/scrapwell/releases/download/v0.1.1/scrapwell-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "e926596a2d7f143c706adb0b1908c423cff22d64a5152d0f33b1e9718e57954f"
    end
    if Hardware::CPU.intel?
      url "https://github.com/argonism/scrapwell/releases/download/v0.1.1/scrapwell-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "bd0829c8e3e372d40597b86377f55813fa36351f34a5da3587c84717a2b8919f"
    end
  end
  license "MIT"

  BINARY_ALIASES = {
    "aarch64-apple-darwin":      {},
    "aarch64-unknown-linux-gnu": {},
    "x86_64-apple-darwin":       {},
    "x86_64-pc-windows-gnu":     {},
    "x86_64-unknown-linux-gnu":  {},
  }.freeze

  def target_triple
    cpu = Hardware::CPU.arm? ? "aarch64" : "x86_64"
    os = OS.mac? ? "apple-darwin" : "unknown-linux-gnu"

    "#{cpu}-#{os}"
  end

  def install_binary_aliases!
    BINARY_ALIASES[target_triple.to_sym].each do |source, dests|
      dests.each do |dest|
        bin.install_symlink bin/source.to_s => dest
      end
    end
  end

  def install
    bin.install "scrapwell" if OS.mac? && Hardware::CPU.arm?
    bin.install "scrapwell" if OS.mac? && Hardware::CPU.intel?
    bin.install "scrapwell" if OS.linux? && Hardware::CPU.arm?
    bin.install "scrapwell" if OS.linux? && Hardware::CPU.intel?

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
