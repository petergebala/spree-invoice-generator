# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_invoice_generator'
  s.version     = '0.0.5'
  s.summary     = 'Spree invoice PDF generation extension.'
  s.description = 'This gem provides invoice pdf generation from a html template via wkhtmltopdf.'
  s.required_ruby_version = '>= 1.8.7'

  s.authors           = ['Peter Gębala', 'Thomas von Deyen']
  s.email             = ['piotrek.gebala@gmail.com']
  s.homepage          = 'https://github.com/magiclabs/spree-invoice-generator'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path  = 'lib'
  s.requirements  << 'wkhtmltopdf'

  s.add_dependency 'spree_core', '~> 1.0.4'
  s.add_dependency 'wicked_pdf'

  s.add_development_dependency 'capybara', '1.0.1'
  s.add_development_dependency 'factory_girl'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'rspec-rails',  '~> 2.7'
  s.add_development_dependency 'sqlite3'
end
