class Scrapwell < Formula
  desc "MCP memory server for LLM agents"
  homepage "https://github.com/argonism/scrapwell"
  version "0.1.4"
  license "MIT"

  on_macos do
    url "https://github.com/argonism/scrapwell/releases/download/v0.1.4/scrapwell-v0.1.4-aarch64-apple-darwin.tar.gz"
    sha256 "0cf9c899ebe995659f8508da8bf25f3e9381b8951f539378bf921cffd9a5a31c"
  end

  on_linux do
    on_arm do
      url "https://github.com/argonism/scrapwell/releases/download/v0.1.4/scrapwell-v0.1.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b7b39e3ba05860dc4437be30de450654d560a954dd1f3a08f76b0bf9da90e459"
    end
    on_intel do
      url "https://github.com/argonism/scrapwell/releases/download/v0.1.4/scrapwell-v0.1.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "16d2a24faf2c718ac87448a81c0620ade7016e525cb6170c96bedbb43725e4f7"
    end
  end

  def install
    bin.install "scrapwell"
  end

  test do
    system "#{bin}/scrapwell", "--version"
  end
end
