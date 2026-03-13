class Picoloom < Formula
  desc "Markdown-to-PDF CLI powered by headless Chrome"
  homepage "https://github.com/alnah/picoloom"
  url "https://github.com/alnah/picoloom/archive/refs/tags/v2.0.0.tar.gz"
  sha256 "e8efffca54749d6eaac1dd28a7937b59c0c25e3241f2f2a95fbd316ec32ad438"
  license "BSD-3-Clause"
  head "https://github.com/alnah/picoloom.git", branch: "main"

  depends_on "go" => :build

  def install
    ldflags = "-s -w -X main.Version=#{version}"

    system "go", "build", *std_go_args(ldflags: ldflags), "./cmd/picoloom"

    generate_completions_from_executable(bin/"picoloom", "completion", shells: [:bash, :fish, :zsh])
  end

  def caveats
    <<~EOS
      `picoloom convert` uses headless Chromium.
      On first run, Rod may download a managed Chromium build into `~/.cache/rod/browser`.
      Set `ROD_BROWSER_BIN` to use an existing Chrome/Chromium installation instead.
    EOS
  end

  test do
    assert_match "picoloom #{version}", shell_output("#{bin}/picoloom version")

    config = testpath/"picoloom.yaml"
    output = shell_output("#{bin}/picoloom config init --no-input --output #{config}")
    assert_match "Configuration file created", output
    assert_path_exists config

    completion = shell_output("#{bin}/picoloom completion bash")
    assert_match "# Bash completion for picoloom", completion
  end
end
