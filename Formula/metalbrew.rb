class Metalbrew < Formula
  desc "Homebrew-compatible, Zig-based bottle package manager for Apple Silicon"
  homepage "https://github.com/4thel00z/metalbrew"
  url "https://github.com/4thel00z/metalbrew/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "7d8103f70a5a9af888dce891c0ada41474420be72d35bb5682ac5f5491491297"
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
