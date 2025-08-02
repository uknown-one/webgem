# webgem.gemspec
Gem::Specification.new do |spec|
  spec.name          = "webgem"
  spec.version       = Webgem::VERSION
  spec.authors       = ["uknown-one"]
  spec.email         = ["uknown-one@users.noreply.github.com"]
  spec.summary       = "Ruby-native, user-friendly toolkit and DSL for web design."
  spec.description   = "WebGem provides a component DSL, theming, responsive grid, and form helpers, all in plain Ruby to build web interfaces without heavy JavaScript frameworks."
  spec.homepage      = "https://github.com/uknown-one/webgem"
  spec.license       = "MIT"

  spec.required_ruby_version = ">= 2.7"

  spec.files         = Dir.chdir(File.expand_path(__dir__)) do
    Dir["lib/**/*.rb"] + ["README.md", "Rakefile"]
  end

  spec.executables   = ["webgem"]
  spec.bindir        = "bin"
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rspec", "~> 4.0"
end
