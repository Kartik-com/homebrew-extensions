# typed: false
# frozen_string_literal: true

require File.expand_path("../Abstract/abstract-php-extension", __dir__)

# Class for Xdebug Extension
class XdebugAT70 < AbstractPhpExtension
  init
  desc "Xdebug PHP extension"
  homepage "https://github.com/xdebug/xdebug"
  url "https://github.com/xdebug/xdebug/archive/2.9.0.tar.gz"
  sha256 "d388ad2564a94c52b19eab26983c3686fae8670e13001b51d2cc3b8a1ac4b733"
  head "https://github.com/xdebug/xdebug.git"
  license "PHP-3.0"

  bottle do
    root_url "https://ghcr.io/v2/shivammathur/extensions"
    sha256 cellar: :any_skip_relocation, arm64_ventura:  "94b73d78caf4658666b91962643d150144ead9ba4f7eb9449fde20d519fe0f1c"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "862b03b6a2a8ff0428903b866edb09fbe4783ab48ddfc20db56a7bacad95d403"
    sha256 cellar: :any_skip_relocation, arm64_big_sur:  "6c312503e93358753ba98ed8598d58694c838f00a013a879a7c89b79a51d5f54"
    sha256 cellar: :any_skip_relocation, ventura:        "f4db889fb97cf2f63a6980a437abecaeddb41a359c9711098ba7494ae92d6183"
    sha256 cellar: :any_skip_relocation, big_sur:        "120570f8b53a5de19d77783c9d2448d97e4139844110b22460bdfe4f2aa55942"
    sha256 cellar: :any_skip_relocation, catalina:       "34d32d37617c0cb5b133bd6e69f73d6a9a53ef538f44686df79237ab532de3dc"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "9c70988193b7858199c7af08bd5d7b8b56b1554d8dfcba636b11aca725ad4513"
  end

  def install
    safe_phpize
    system "./configure", "--prefix=#{prefix}", phpconfig, "--enable-xdebug"
    system "make"
    prefix.install "modules/#{extension}.so"
    write_config_file
  end
end
