require 'wicked_pdf'
WickedPdf.config = {
  :exe_path => SpreeInvoiceGenerator.wkhtmltopdf_binary
}.merge(SpreeInvoiceGenerator.wkhtmltopdf_options)
