# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "wreddit/version"

Gem::Specification.new do |spec|
  spec.name          = "wreddit"
  spec.version       = Wreddit::VERSION
  spec.authors       = ["Sean Hulse"]
  spec.email         = ["seanjhulse@gmail.com"]

  spec.summary       = %q{Turn Reddit's API into a simple class}
  spec.description   = %q{Reddit has a built-in API with JSON requests. The WReddit class allows users to access the JSON data for quick applications}
  spec.homepage      = %q{https://github.com/CoffeeAndCream/wreddit}
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = %q{https://rubygems.org}
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "nokogiri"
  spec.add_development_dependency "httparty"
end
