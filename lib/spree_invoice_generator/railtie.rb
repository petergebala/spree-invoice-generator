require 'spree_invoice_generator'
require 'rails'
module SpreeInvoiceGenerator
  class Railtie < Rails::Railtie
    rake_tasks do
      require '../tasks/spree_invoice_prints.rake'
    end
  end
end
