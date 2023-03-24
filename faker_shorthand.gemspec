require_relative 'lib/faker_shorthand'

Gem::Specification.new do |spec|
  spec.name          = "faker_shorthand"
  spec.version       = Faker::Shorthand::VERSION
  spec.authors       = ["Adam Cuppy"]
  spec.email         = ["acuppy@hey.com"]

  spec.summary       = %q{Shorthand for the Faker generator syntax}
  spec.description   = %q{Shorthand for the Faker generator syntax}
  spec.homepage      = "https://github.com/acuppy/faker_shorthand"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/acuppy/faker_shorthand"
  spec.metadata["changelog_uri"] = "https://github.com/acuppy/faker_shorthand"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.add_dependency 'faker'
end