Gem::Specification.new do |s|
  s.name          = "cucumber-pretty_fail_formatter"
  s.version       = '0.0.4'
  s.platform      = Gem::Platform::RUBY
  s.authors       = ["Philipp Tessenow"]
  s.email         = ["philipp@tessenow.org"]
  s.homepage      = "https://github.com/tessi/cucumber-pretty_fail_formatter"
  s.summary       = %q{A cucumber formatter which is concise on success and pretty on failures}
  s.description   = %q{A cucumber formatter which is concise on success and pretty on failures}
  s.licenses      = ["MIT"]

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency 'cucumber', ["~> 1.3.0"]
end
