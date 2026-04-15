class Scrapwell < Formula
  desc "MCP memory server for LLM agents"
  homepage "https://github.com/argonism/scrapwell"
  version "0.1.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/argonism/scrapwell/releases/download/v0.1.0/scrapwell-aarch64-apple-darwin.tar.xz"
      sha256 "dd6955d006babd4b0dacf9bbf9137135a32cad4498d0a68aa12e7e46674e4ed0"
    end
    if Hardware::CPU.intel?
      url "https://github.com/argonism/scrapwell/releases/download/v0.1.0/scrapwell-x86_64-apple-darwin.tar.xz"
      sha256 "7487dff31e4017c4e21400d5f41a50c71bdf00f2ee2e9b31299aabf5b61bdf82"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/argonism/scrapwell/releases/download/v0.1.0/scrapwell-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "3b67731214b8dbf3e4f026197a947fbc4d6bbbcbf4e6debbb0d0f4f7ac16d476"
    end
    if Hardware::CPU.intel?
      url "https://github.com/argonism/scrapwell/releases/download/v0.1.0/scrapwell-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "18d8a0bb74ae3832e20176e51f5ee13f899f18572457d26241658d60927cce90"
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
