# Only configuration stuff in main namespace
module SpreeInvoiceGenerator
  # Options defined for Spree Extension.
  @@except_payment        = ['Spree::PaymentMethod::Check']
  @@wkhtmltopdf_binary    = "/usr/bin/wkhtmltopdf"
  @@wkhtmltopdf_options   = {
    :template => "spree/invoice_prints/show.html.erb",
    :margin => {
      :top    => 10,
      :bottom => 10,
      :left   => 15,
      :right  => 15
    }
  }

  # Generating module accessors for options defined above.
  [:except_payment, :wkhtmltopdf_binary, :wkhtmltopdf_options].each do |mth|
    define_singleton_method mth do
      class_variable_get :"@@#{mth}"
    end

    define_singleton_method "#{mth}=" do |val|
      class_variable_set :"@@#{mth}", val
    end
  end

  # Default way to configure engine
  def self.setup
    yield self
  end
end

require 'spree_core'
require 'spree_invoice_generator/engine'
require 'spree_invoice_generator/version'
require 'spree_invoice_generator/railtie'
require 'spree_invoice_generator/wicked_pdf'
