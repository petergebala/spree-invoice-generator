# Spree Invoice Generator

This gem provides model responsible for generating pdf from html file.

## Installation

### Add to Gemfile:

    gem 'spree_invoice_generator', :git => 'git://github.com/petergebala/spree-invoice-generator.git'
    
then run:

    bundle

### Execute: 

    rails g spree_invoice_generator:install

## Configuration: 

In file config/initializers/spree_invoice_generator.rb please check your configuration for wkhtmltopdf bin path. 

For more see: [wicked_pdf](https://github.com/mileszs/wicked_pdf)

### In any model you can generate pdf string:

```ruby
Spree::InvoicePrint.find_by_order_id('some id').try(:generate_pdf)
```

or:

```ruby
Spree::Order.last.invoice_print.generate_pdf
```

or:

```ruby
pdfs = []
Spree::User.last.invoice_prints.each { |e| pdfs << e.generate_pdf }
```

You can also check how many times invoice was generated - column: counter

### Customize template.

Before use it please customize your invoice template.


## TODO
1. write missing tests
2. clean up model invoice_print
3. add counter increase after generating pdf from controller
4. create default invoice template
5. checkout todos in code
6. write better documentation