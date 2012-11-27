require 'spree_core'
require 'spree_invoice_generator/engine'

module SpreeInvoiceGenerator
  # Options defined for Spree Extension.
  @@invoice_template_path = "app/views/spree/invoice_prints/invoice_template.html.erb"
  @@except_payment        = ['Spree::PaymentMethod::Check']
  @@wkhtmltopdf_binary    = "/usr/bin/wkhtmltopdf"
  @@wkhtmltopdf_options   = {
    :top    => 10,
    :bottom => 10,
    :left   => 15,
    :right  => 15
  }

  # Generating module accessors for options defined above.
  [:invoice_template_path, :except_payment, :wkhtmltopdf_binary, :wkhtmltopdf_options].each do |mth|
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
