# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 's3proxy/version'

Gem::Specification.new do |spec|
  spec.name          = 's3proxy'
  spec.version       = S3Proxy::VERSION
  spec.authors       = ["Jurgens du Toit"]
  spec.email         = ["jrgns@jrgns.net"]

  spec.summary       = %q{Proxy and cache requests to S3 to allow access.}
  spec.description   = %q{Grant users access to files on S3 through your program.}
  spec.homepage      = "https://github.com/jrgns/s3proxy"
  spec.license       = "MIT"

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'bundler', '~> 1.12'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_dependency 'aws-sdk'
end
