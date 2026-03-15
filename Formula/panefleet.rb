class Panefleet < Formula
  desc "tmux workboard plugin for agent panes"
  homepage "https://github.com/alnah/panefleet"
  url "https://github.com/alnah/panefleet/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "14518d741af992a9ba01eb981946152c9d66ef4a2c5d3ec9243fde05ab08d4c4"
  head "https://github.com/alnah/panefleet.git", branch: "main"

  depends_on "bash"
  depends_on "fzf"
  depends_on "ripgrep"
  depends_on "tmux"

  def install
    libexec.install Dir["*"]
    bin.write_exec_script libexec/"bin/panefleet"
    (share/"panefleet").install libexec/"panefleet.tmux"
  end

  def caveats
    <<~EOS
      Core install:
        panefleet install core

      Provider integrations:
        panefleet install codex|claude|opencode|all

      Validate setup:
        panefleet doctor --install
    EOS
  end

  test do
    output = shell_output("#{bin}/panefleet install core")
    assert_match "Load core in tmux with:", output
    assert_match "panefleet.tmux", output
  end
end
