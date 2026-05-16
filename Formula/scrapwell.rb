class Scrapwell < Formula
  desc "MCP memory server for LLM agents"
  homepage "https://github.com/argonism/scrapwell"
  version "0.1.5"
  license "MIT"

  on_macos do
    url "https://github.com/argonism/scrapwell/releases/download/v0.1.5/scrapwell-v0.1.5-aarch64-apple-darwin.tar.gz"
    sha256 "756c2e79bae1b0fee5eca481e37743278c1ca867940bd04e6dff75e91eb7705d"
  end

  on_linux do
    on_arm do
      url "https://github.com/argonism/scrapwell/releases/download/v0.1.5/scrapwell-v0.1.5-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d7a788dc4823a04854b969a3c82ed12cdb723ce65796b5c1fdb8fc6954780737"
    end
    on_intel do
      url "https://github.com/argonism/scrapwell/releases/download/v0.1.5/scrapwell-v0.1.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4ab07ae74841d66d16935bdbc1ae09ae67f34f82d059701f457ec4954ca63b04"
    end
  end

  def install
    bin.install "scrapwell"
  end

  test do
    system "#{bin}/scrapwell", "--version"
  end
end
