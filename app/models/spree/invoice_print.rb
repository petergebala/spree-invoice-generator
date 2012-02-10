module Spree
  require 'erb'
  class InvoicePrint < ActiveRecord::Base
    belongs_to :user
    belongs_to :order

    @@config = {}
    cattr_accessor :config

    def generate_pdf
      @order        = self.order 
      raise "#{@@config.inspect}"
      html_template = File.open(@@config[:template_path]).read
      self.update_attribute(:counter, self.counter + 1)
      WickedPdf.new.pdf_from_string(ERB.new(html_template).result(binding).html_safe)
    end
  end
end
