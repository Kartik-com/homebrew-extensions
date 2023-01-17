# typed: false
# frozen_string_literal: true

require File.expand_path("../Abstract/abstract-php-extension", __dir__)

# Class for Mongodb Extension
class MongodbAT72 < AbstractPhpExtension
  init
  desc "Mongodb PHP extension"
  homepage "https://github.com/mongodb/mongo-php-driver"
  url "https://pecl.php.net/get/mongodb-1.15.0.tgz"
  sha256 "eeb6268d34bd0b4a3dcc60dde4e484f5cf4fa2439ca3d9f024c0000e99ee7240"
  head "https://github.com/mongodb/mongo-php-driver.git"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/shivammathur/homebrew-extensions/releases/download/mongodb@7.2-1.15.0"
    rebuild 1
    sha256 cellar: :any,                 arm64_monterey: "4fa61cc9f88298f84663aff085e0e60a77d5ef67a77f916683be54baeebdf83c"
    sha256 cellar: :any,                 arm64_big_sur:  "ca2c26b4a9baa2604dd4ab97259af82ba05bea56f79a267e42fd1cdbc877b55d"
    sha256 cellar: :any,                 monterey:       "d5cc11b729c2e24cb687afee2f62c755bdfe952adf720b70861928f8299dc855"
    sha256 cellar: :any,                 big_sur:        "6735de422c256fd8e6880366bfe6201c79363f109fc35cd824eb38bbc0f84064"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "402feb94c0e9782634c51f9a62ff4cdcc047031a9f3f6cba9c4fbf8da7c80d30"
  end

  depends_on "icu4c"
  depends_on "openssl@1.1"
  depends_on "snappy"
  depends_on "zlib"
  depends_on "zstd"

  def install
    Dir.chdir "mongodb-#{version}"
    safe_phpize
    system "./configure", "--prefix=#{prefix}", phpconfig, "--enable-mongodb"
    system "make"
    prefix.install "modules/#{extension}.so"
    write_config_file
    add_include_files
  end
end
