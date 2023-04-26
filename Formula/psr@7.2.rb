require File.expand_path("../Abstract/abstract-php-extension", __dir__)

class PsrAT72 < AbstractPhpExtension
  init
  desc "PHP extension providing the accepted PSR interfaces "
  homepage "https://github.com/jbboehr/php-psr"
  url "https://pecl.php.net/get/psr-1.1.0.tgz"
  sha256 "4feb8eeea4237894bcab1ea064cefc3421c909778d39c977184c16e725cfbfb2"
  head "https://github.com/jbboehr/php-psr.git"
  license "BSD-2-Clause"

  bottle do
    root_url "https://ghcr.io/v2/shivammathur/extensions"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "4494e93cbf3c8c7f5854cc8921bd43ad0bb900eb43ee69dd6b883ed9015d8a9c"
    sha256 cellar: :any_skip_relocation, arm64_big_sur:  "1174d0390fa8ebdad9c352490709e5e9ba5a3c26307bd662a6d44735bb653b51"
    sha256 cellar: :any_skip_relocation, ventura:        "7a4c5b62b1166f031a811ce57804dfa3852a51efb637d2235ac86ce3a5354310"
    sha256 cellar: :any_skip_relocation, monterey:       "e8a3e3cbb4cf1f836733f8ae3b68a4ea12727b5a30d0feea3523569faa6e0db3"
    sha256 cellar: :any_skip_relocation, big_sur:        "6f628e993bd86d669febb15b30017def78885cda5a2e861b223f355090a32844"
    sha256 cellar: :any_skip_relocation, catalina:       "7631d58de4468f14c478545ec51cde02dbb71c1b14f5bb63eb494d96f46434bd"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "b6aec61b8820a7c2f197873321855703e4442b5e51582b571d1764db30d73cec"
  end

  depends_on "pcre"

  def install
    Dir.chdir "psr-#{version}"
    safe_phpize
    system "./configure", "--prefix=#{prefix}", phpconfig, "--enable-psr"
    system "make"
    prefix.install "modules/psr.so"
    write_config_file
  end
end
