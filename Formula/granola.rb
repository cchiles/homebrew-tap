class Granola < Formula
  desc "CLI for Granola meeting notes"
  homepage "https://github.com/cchiles/granola-cli"
  version "0.1.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cchiles/granola-cli/releases/download/v#{version}/granola-darwin-arm64"
      sha256 "0491e21f3e9559338a3f7c00a1c19367e9809570ffecfa36edbadc527fef91f8"
    else
      url "https://github.com/cchiles/granola-cli/releases/download/v#{version}/granola-darwin-x64"
      sha256 "80c85a45cd76668681ed97d6b2a1f0af98f66a8d76fd40d6b6f4c3c7cd796e7c"
    end
  end

  def install
    binary = Hardware::CPU.arm? ? "granola-darwin-arm64" : "granola-darwin-x64"
    bin.install binary => "granola"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/granola --version")
  end
end
