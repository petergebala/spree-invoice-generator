require 'spree_core'
require 'spree_invoice_generator/engine'

module SpreeInvoiceGenerator
  class Engine < Rails::Engine
    config.to_prepare do
      Dir.glob(File.join(File.dirname(__FILE__), "../app/**/*_decorator*.rb")) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end
    end
  end
end
