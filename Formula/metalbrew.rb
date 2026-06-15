class Metalbrew < Formula
  desc "Homebrew-compatible, Zig-based bottle package manager for Apple Silicon"
  homepage "https://github.com/4thel00z/metalbrew"
  url "https://github.com/4thel00z/metalbrew/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "e37ac706161af81c484acd6e8fa121cfa23d799259a0cab3a79a68d0f8a52aab"
  license "MIT"
  head "https://github.com/4thel00z/metalbrew.git", branch: "master"

  depends_on "zig" => :build
  depends_on arch: :arm64
  depends_on :macos

  def install
    ENV["ZIG_GLOBAL_CACHE_DIR"] = buildpath/".zig-global-cache"
    system "zig", "build", "--prefix", prefix, "-Doptimize=ReleaseSafe"
  end

  test do
    assert_match "Homebrew reimplementation", shell_output("#{bin}/metalbrew help")
  end
end
