module Spree
  class InvoicePrint < ActiveRecord::Base
    belongs_to :user
    belongs_to :order

    @@config = {
      :template_path => Rails.root.join("app/views/spree/invoice_prints/invoice_template.html.erb"),
      :except_payment => ['Spree::PaymentMethod::Check'],
      :invoice_number_generation_method => lambda { |next_invoice_count|
        number = "%04d" % next_invoice_count.to_s
        "R-#{Time.now.year}-#{number}"
      }
    }

    cattr_accessor :config

    def generate_pdf
      html_template = File.open(@@config[:template_path]).read
      self.update_attribute(:counter, self.counter + 1)
      WickedPdf.new.pdf_from_string(Erubis::Eruby.new(html_template).result(:@order => self.order).html_safe)
    end

  private

    def generate_invoice_number
      write_attribute(:invoice_number, @@config[:invoice_number_generation_method].call(InvoicePrint.from_current_year.length + 1))
    end

  end
end
