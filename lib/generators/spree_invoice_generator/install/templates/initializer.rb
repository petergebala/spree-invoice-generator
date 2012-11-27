SpreeInvoiceGenerator.setup do |config|
  # Main file for invoice template.
  config.invoice_template_path = "app/views/spree/invoice_prints/invoice_template.html.erb"

  # Do not use this payment methods.
  config.except_payment        = ['Spree::PaymentMethod::Check']

  # Wkhtmltopdf binary file. Check by system command: which wkhtmltopdf.
  config.wkhtmltopdf_binary    = "/usr/bin/wkhtmltopdf"

  # Options which will be passed to wkhtmltopdf.
  config.wkhtmltopdf_options   = {
    :top    => 10,
    :bottom => 10,
    :left   => 15,
    :right  => 15
  }
end
