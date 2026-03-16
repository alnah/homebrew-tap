class Panefleet < Formula
  desc "tmux workboard plugin for agent panes"
  homepage "https://github.com/alnah/panefleet"
  url "https://github.com/alnah/panefleet/archive/refs/tags/v0.3.4.tar.gz"
  sha256 "069b4681a73f117599fd4b81073dbce45e010d33867bc0f331f0e3c75ae64cfb"
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
