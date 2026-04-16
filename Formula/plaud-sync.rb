class PlaudSync < Formula
  desc "Sync and transcribe Plaud recordings with speaker diarization"
  homepage "https://github.com/cchiles/plaud-sync"
  version "0.3.8"
  license "MIT"

  depends_on arch: :arm64
  depends_on "uv"

  url "https://github.com/cchiles/plaud-sync/releases/download/v0.3.8/plaud-sync-darwin-arm64.tar.gz"
  sha256 "eaccb97432bb2a16f2c7e2822bc53f187264eb35aaa0f0cdc734b0c332455c65"

  def install
    bin.install "plaud-sync"
  end

  service do
    run [opt_bin/"plaud-sync", "sync"]
    run_type :interval
    interval 1800
    log_path var/"log/plaud-sync/stdout.log"
    error_log_path var/"log/plaud-sync/stderr.log"
    working_dir Dir.home
  end

  test do
    assert_match "plaud-sync", shell_output("#{bin}/plaud-sync 2>&1", 0)
  end
end
