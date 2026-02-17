class Eashobies < Formula
  desc "EAS HOBBIES - Interactive school hobbies website app"
  homepage "https://github.com/Gityus13/apps"
  url "https://github.com/Gityus13/apps/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "YOUR_SHA256_HERE" # You'll need to calculate this after creating the release
  license "MIT"

  depends_on "node" => :optional # Only if you need Node.js for anything

  def install
    # Create the main app directory
    prefix.install Dir["*"]
    
    # Create bin wrapper script
    (bin/"eashobies").write <<~EOS
      #!/bin/bash
      # Open the EAS HOBBIES website in the default browser
      open "https://eashobies.site"
      
      # Optional: If you want to run a local server instead
      # cd "#{prefix}" && python3 -m http.server 8080
      # open "http://localhost:8080"
    EOS
    
    # Make the script executable
    chmod 0755, bin/"eashobies"
  end

  test do
    assert_match "EAS HOBBIES", shell_output("#{bin}/eashobies --help 2>&1", 1)
  end
end
