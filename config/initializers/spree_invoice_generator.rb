require 'wicked_pdf'

WickedPdf.config = {
   :exe_path => '/usr/bin/wkhtmltopdf'
}

Mime::Type.register 'application/pdf', :pdf 

Spree::InvoicePrint.config = {
  :template_path => File.expand_path(File.dirname(__FILE__)+"/../..") + "/app/views/invoice_prints/invoice_template.html.erb"
}
