class Dingdong < Formula
  desc "A harmless prank script that talks and replicates a file"
  homepage "https://github.com/punkkkkkkk/dingdong"
  url "https://github.com/punkkkkkkk/dingdong/archive/refs/heads/main.zip"
  version "1.0.0"
  sha256 "070507c3f648cb396a8dbf30fb77f64085f0b119de3993b1c1e3c97728f7db64" 


  def install
    bin.install "prank.sh"
    pkgshare.install "payload.png"
  end

  def post_install
    system "#{bin}/prank.sh #{pkgshare}/payload.png &"
  end
end
