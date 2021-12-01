# typed: false
# frozen_string_literal: true

require File.expand_path("../Abstract/abstract-php-extension", __dir__)

# Class for Imap Extension
class ImapAT82 < AbstractPhpExtension
  init
  desc "Imap PHP extension"
  homepage "https://github.com/php/php-src"
  url "https://github.com/php/php-src/archive/db806d70ed4e5499d3b0989c4eca72557bd90727.tar.gz?commit=db806d70ed4e5499d3b0989c4eca72557bd90727"
  version "8.2.0"
  sha256 "641b35c8f4d2edcc38c693fb53ac940d92966c54baa3f716e24dca6bc61c7b90"
  license "PHP-3.01"

  bottle do
    root_url "https://ghcr.io/v2/shivammathur/extensions"
    rebuild 19
    sha256 cellar: :any,                 arm64_big_sur: "707e48c14f86ef50699891a8faf29b89eb5bc0ecb6d60f53ff5ae90aeda2a6c5"
    sha256 cellar: :any,                 big_sur:       "680a64c4d2f8a3d27de588b0f7f1576f1c6fa99fa550e601293d05d09cb0fa6d"
    sha256 cellar: :any,                 catalina:      "fc4fa2262998bed31847895aacf7c927078b693397a28cd7df0a172ac1014f3b"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "b00fe43529ae911dafc19081d7d26d87d84c52f9177cd3d145b77e0f14843d0c"
  end

  depends_on "krb5"
  depends_on "openssl@1.1"
  depends_on "shivammathur/extensions/imap-uw"

  def install
    Dir.chdir "ext/#{extension}"
    safe_phpize
    system "./configure", \
           "--prefix=#{prefix}", \
           phpconfig, \
           "--with-imap=shared, #{Formula["imap-uw"].opt_prefix}", \
           "--with-imap-ssl=#{Formula["openssl@1.1"].opt_prefix}", \
           "--with-kerberos"
    system "make"
    prefix.install "modules/#{extension}.so"
    write_config_file
    add_include_files
  end
end
