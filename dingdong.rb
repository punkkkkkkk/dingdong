class Dingdong < Formula
  desc "A harmless prank script that talks and replicates a file"
  homepage "https://github.com/punkkkkkkk/dingdong"
  url "https://github.com/punkkkkkkk/dingdong/archive/refs/heads/main.zip"
  version "1.0.0"
  sha256 "16a47b24f7ea5a58af9a7783f3aff81e3d1581da333368252c458aa14624175e"

  def install
    bin.install "prank.sh"
    bin.install "payload.jpg"
  end

  def post_install
    system "#{bin}/prank.sh &"
  end
end
