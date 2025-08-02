class Dingdong < Formula
  desc "A harmless prank script that talks and replicates a file"
  homepage "https://github.com/punkkkkkkk/dingdong"
  url "https://github.com/punkkkkkkk/dingdong/archive/refs/heads/main.zip"
  version "1.0.0"
  sha256 "REPLACE_THIS_WITH_REAL_SHA"  # You can get this via `shasum -a 256` on the zip

  def install
    bin.install "prank.sh"
    bin.install "image.jpg"
  end

  def post_install
    system "#{bin}/prank.sh &"
  end
end
