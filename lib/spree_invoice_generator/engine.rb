# move it to main file responsible for require
require File.join(File.dirname(__FILE__), 'wkhtmltopdf')

module SpreeInvoiceGenerator
  class Engine < ::Rails::Engine
    engine_name 'spree_invoice_generator'

    # TODO
    # Throw it out and add require!
    config.autoload_paths += %W(#{config.root}/lib)

    # TODO
    # Have to change that shit and move to initializers
    config.to_prepare do
      Dir.glob(File.join(File.dirname(__FILE__), "../../app/**/*_decorator*.rb")) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end
    end

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end


    # TODO
    # WTF?! Remve it!
    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), "../../app/**/*_decorator*.rb")) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end
    end

    # TODO
    # Also WTF?! remove it and use new correct way to config engines
    config.to_prepare &method(:activate).to_proc
  end
end
