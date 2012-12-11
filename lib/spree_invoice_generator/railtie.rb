require 'spree_invoice_generator'
require 'rails'
module SpreeInvoiceGenerator
  class Railtie < Rails::Railtie
    rake_tasks do
      Dir[File.join(File.dirname(__FILE__),'../tasks/*.rake')].each { |f| load f }
    end
  end
end
