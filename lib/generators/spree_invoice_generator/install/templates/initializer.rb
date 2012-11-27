SpreeInvoiceGenerator.setup do |config|
  # Do not use this payment methods.
  config.except_payment        = ['Spree::PaymentMethod::Check']

  # Wkhtmltopdf binary file. Check by system command: which wkhtmltopdf.
  config.wkhtmltopdf_binary    = "/usr/bin/wkhtmltopdf"

  # Options which will be passed to wkhtmltopdf.
  config.wkhtmltopdf_options   = {
    template: "spree/invoice_prints/show.html.erb",
    margin: {
      top:    10,
      bottom: 10,
      left:   15,
      right:  15
    }
  }
end
