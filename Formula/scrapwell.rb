class Scrapwell < Formula
  desc "MCP memory server for LLM agents"
  homepage "https://github.com/argonism/scrapwell"
  version "0.1.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/argonism/scrapwell/releases/download/v0.1.2/scrapwell-v0.1.2-aarch64-apple-darwin.tar.gz"
      sha256 "caba5928994d51d57f215c0e73a1ff4dd60692ef2c59678af966332b7130b401"
    end
    on_intel do
      url "https://github.com/argonism/scrapwell/releases/download/v0.1.2/scrapwell-v0.1.2-x86_64-apple-darwin.tar.gz"
      sha256 "2c453261d691206a237f05846ba5e6e6ee15eb810e69279b400f3a87ec0e6376"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/argonism/scrapwell/releases/download/v0.1.2/scrapwell-v0.1.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "aa715e0428101e9b87786dd677c36dd72555983d036c475b732d23553a39c61c"
    end
    on_intel do
      url "https://github.com/argonism/scrapwell/releases/download/v0.1.2/scrapwell-v0.1.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8254333c07d91c6cca18baa6b8587697d16ff5709817f6bc6ae053a0472decc0"
    end
  end

  def install
    bin.install "scrapwell"
  end

  test do
    system "#{bin}/scrapwell", "--version"
  end
end
