class AlcNg < Formula
  desc "Modern LaTeX sanitization tool for arXiv submissions"
  homepage "https://github.com/COMSYS/ALC-NG"
  url "https://github.com/COMSYS/ALC-NG/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "a2d22b44d905a1656a60de5509cc111d82c227802422fbe0609c123b7d072b34"
  license "MIT"

  depends_on "llvm" => :build
  depends_on "node" => :build
  depends_on "rust" => :build

  def install
    ENV["CC"] = formula_opt_bin("llvm")/"clang"

    system "cargo", "install",
           *std_cargo_args(path: ".")
  end

  test do
    output = shell_output("#{bin}/alc-ng --help")
    assert_match "alc-ng", output
  end
end
