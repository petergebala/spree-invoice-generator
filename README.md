#SpreeInvoiceGenerator
=====================
This gem provides model responsible for generating pdf from html file.

##Installation
=======

###Add to Gemfile:
-------
	 gem 'spree_invoice_generator', :git => 'git://github.com/petergebala/spree-invoice-generator.git'
   bundle

###Execute: 
-------
	rails g spree_invoice_generator:install

###Configuration: 
-------
In file config/initializers/spree_invoice_generator.rb please check your configuration for wkhtmltopdf bin path. 
For more see: [wicked_pdf](https://github.com/mileszs/wicked_pdf)

###In any model you can generate pdf string:
-------
	Spree::InvoicePrint.find_by_order_id('some id').try(:generate_pdf)

or:

	Order.last.invoice_print.generate_pdf

or: 

	pdfs = []
	User.last.invoice_prints.each { |e| pdfs << e.generate_pdf }

You can also check how many times invoice was generated - column: counter
