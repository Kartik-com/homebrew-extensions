# typed: false
# frozen_string_literal: true

require File.expand_path("../Abstract/abstract-php-extension", __dir__)

# Class for Imap Extension
class ImapAT81 < AbstractPhpExtension
  init
  desc "Imap PHP extension"
  homepage "https://github.com/php/php-src"
  url "https://github.com/php/php-src/archive/2d248c80b9f0cd2248ec68b32a05cee7d60e3c5b.tar.gz?commit=2d248c80b9f0cd2248ec68b32a05cee7d60e3c5b"
  version "8.1.0"
  sha256 "05c858859d8c4df5d421e220855d582601a93ba828e7bc2418ffe3b17753e3f6"
  license "PHP-3.01"

  bottle do
    root_url "https://ghcr.io/v2/shivammathur/extensions"
    rebuild 19
    sha256 cellar: :any, arm64_big_sur: "376ac99a170f31c31379adaec90114823fd9a8ed36c6e64716303ebc29cae754"
    sha256 cellar: :any, big_sur:       "10d8e6b18e0a239c84c58a7828b8b68cac6bf6658b91a8fe543ab1ff440a8879"
    sha256 cellar: :any, catalina:      "0dfb0e85e3b778f439d66b5df3a820366b575c1e05b672e896ee6377a798a17f"
  end

  depends_on "imap-uw"
  depends_on "openssl@1.1"
  depends_on "krb5"

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
