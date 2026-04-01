class PlaudSync < Formula
  desc "Sync and transcribe Plaud recordings with speaker diarization"
  homepage "https://github.com/cchiles/plaud-sync"
  version "0.1.0"
  license "MIT"

  depends_on arch: :arm64
  depends_on "uv"

  url "https://github.com/cchiles/plaud-sync/releases/download/v0.1.0/plaud-sync-darwin-arm64.tar.gz"
  sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"

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
