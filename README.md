SpreeInvoiceGenerator
=====================
This gem provides model responsible for generating pdf from html file.

Example
=======

Add to Gemfile:
-------
	 gem 'spree_invoice_generator'

Execute: 
-------
	rails g spree_invoice_generator:install

In any model you can generate pdf string:
-------
	Spree::InvoicePrint.find_by_order_id('some id').try(:generate_pdf)

or:

	Order.last.invoice_print.generate_pdf

or: 

	pdfs = []
	User.last.invoice_prints.each { |e| pdfs << e.generate_pdf }

You can also check how many times invoice was generated - column: counter
