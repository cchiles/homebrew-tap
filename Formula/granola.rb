class Granola < Formula
  desc "CLI for Granola meeting notes"
  homepage "https://github.com/cchiles/granola-cli"
  version "0.1.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cchiles/granola-cli/releases/download/v#{version}/granola-darwin-arm64"
      sha256 "d57920fd0f376b50f9c7384e7c08c4d1672fea0eb14cb6cb495b7ea35b5346de"
    else
      url "https://github.com/cchiles/granola-cli/releases/download/v#{version}/granola-darwin-x64"
      sha256 "16d67a3ea6cd230607905c0eeee39605739b4d1e5dc9b60d6cfee53ae2f38196"
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
