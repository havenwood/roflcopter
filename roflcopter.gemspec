# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'roflcopter/version'

Gem::Specification.new do |gem|
  gem.name          = 'roflcopter'
  gem.version       = Roflcopter::VERSION
  gem.authors       = ['Shannon Skipper']
  gem.email         = ['shannonskipper@gmail.com']
  gem.description   = %q{An OS X roflcopter gem}
  gem.summary       = %q{This roflcopter runs on OS X, flys around, and makes a whoosh whoosh sound.}
  gem.homepage      = 'https://github.com/havenwood/roflcopter'
  
  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.require_paths = ['lib']
  
  gem.signing_key = '/Users/shannonskipper/.gem/private/gem-private_key.pem'
  gem.cert_chain  = ['/Users/shannonskipper/.gem/private/gem-public_cert.pem']
end
