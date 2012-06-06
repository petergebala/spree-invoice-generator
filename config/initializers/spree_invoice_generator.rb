require 'wicked_pdf'

WickedPdf.config = {
  :exe_path => SpreeInvoiceGenerator::WKHTMLToPDF.bin_path
}

Spree::InvoicePrint.config = {
  :template_path => File.expand_path(File.dirname(__FILE__)+"/../..") + "/app/views/invoice_prints/invoice_template.html.erb",
  :except_payment => ['Spree::PaymentMethod::Check']
}
