require 'spree_core'
require 'spree_invoice_generator/engine'

module SpreeInvoiceGenerator
  mattr_accessor :invoice_template_path
  # Absolute path
  @@invoice_template_path = "app/views/spree/invoice_prints/invoice_template.html.erb"

  mattr_accessor :except_payment
  @@except_payment = ['Spree::PaymentMethod::Check']

  mattr_accessor :wkhtmltopdf_bin
  @@wkhtmltopdf_bin

  mattr_accesor :wkhtmltopdf_margin
  @@wkhtmltopdf_margin = {
    :top    => 10,
    :bottom => 10,
    :left   => 15,
    :right  => 15
  }

  # Default way to configure engine
  def self.setup
    yield self
  end
end
