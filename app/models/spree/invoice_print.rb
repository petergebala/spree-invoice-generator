module Spree
  require 'erb'
  class InvoicePrint < ActiveRecord::Base
    belongs_to :user
    belongs_to :order

    @@config = {
      :template_path => File.expand_path(File.dirname(__FILE__)+"/../..") + "/views/spree/invoice_prints/invoice_template.html.erb",
      :except_payment => ['Spree::PaymentMethod::Check']
    }

    cattr_accessor :config

    def generate_pdf
      @order        = self.order
      html_template = File.open(@@config[:template_path]).read
      self.update_attribute(:counter, self.counter + 1)
      WickedPdf.new.pdf_from_string(ERB.new(html_template).result(binding).html_safe)
    end
  end
end
