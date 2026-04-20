class Scrapwell < Formula
  desc "MCP memory server for LLM agents"
  homepage "https://github.com/argonism/scrapwell"
  version "0.1.3"
  license "MIT"

  on_macos do
    url "https://github.com/argonism/scrapwell/releases/download/v0.1.3/scrapwell-v0.1.3-aarch64-apple-darwin.tar.gz"
    sha256 "218f127a7a8a76cbbce7bebd1d34d70acc5d7a26063b8c5e9a8e2635e50e7a81"
  end

  on_linux do
    on_arm do
      url "https://github.com/argonism/scrapwell/releases/download/v0.1.3/scrapwell-v0.1.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fa38aa9746497a9e6d44c98783bf70382088c39087416b345f2f404a84671775"
    end
    on_intel do
      url "https://github.com/argonism/scrapwell/releases/download/v0.1.3/scrapwell-v0.1.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d97dbabc71e50aedb7a90fdb3ec7e5da4129a8f77f0a20a6324e9023b076a4be"
    end
  end

  def install
    bin.install "scrapwell"
  end

  test do
    system "#{bin}/scrapwell", "--version"
  end
end
