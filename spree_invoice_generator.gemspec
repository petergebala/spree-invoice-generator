# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_invoice_generator'
  s.version     = '0.0.1a'
  s.summary     = 'TODO: Add gem summary here'
  s.description = 'Gem providing invoice pdf generation from html template'
  s.required_ruby_version = '>= 1.8.7'

  s.author            = 'Peter Gębala'
  s.email             = 'piotrek.gebala@gmail.com'
  s.homepage          = 'https://github.com/kebag/spree-invoice-generator'

  #s.files         = `git ls-files`.split("\n")
  #s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree_core', '1.0.0.rc3'
  s.add_dependency 'wicked_pdf'

  s.add_development_dependency 'capybara', '1.0.1'
  s.add_development_dependency 'factory_girl'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'rspec-rails',  '~> 2.7'
  s.add_development_dependency 'sqlite3'
end
