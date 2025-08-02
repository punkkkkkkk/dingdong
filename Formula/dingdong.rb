class Dingdong < Formula
  desc "A harmless prank script that talks and replicates a file"
  homepage "https://github.com/punkkkkkkk/dingdong"
  url "https://github.com/punkkkkkkk/dingdong/archive/refs/heads/main.zip"
  version "1.0.0"
  sha256 "e514d16d8d94a88fbd614479afb097c64fc974b0e4fa401f5f090d722c434771" 


  def install
    bin.install "prank.sh"
    pkgshare.install "payload.png"
  end

  def post_install
    system "#{bin}/prank.sh #{pkgshare}/payload.png &"
  end
end
