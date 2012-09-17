module Spree
  class InvoicePrint < ActiveRecord::Base

    cattr_accessor :config
    self.config = {
      :template_path => Rails.root.join("app/views/spree/invoice_prints/invoice_template.html.erb"),
      :except_payment => ['Spree::PaymentMethod::Check'],
      :invoice_number_generation_method => lambda { |next_invoice_count|
        number = "%04d" % next_invoice_count.to_s
        "R-#{Time.now.year}-#{number}"
      },
      :page_margins => {
        :top    => 0,
        :bottom => 0,
        :left   => 20,
        :right  => 15
      }
    }

    belongs_to :user
    belongs_to :order

    before_create :generate_invoice_number

    scope :from_current_year, where(["created_at > ? AND created_at < ?", Time.now.at_beginning_of_year, Time.now.at_end_of_year])

    def generate_pdf
      self.update_attribute(:counter, self.counter + 1)
      WickedPdf.new.pdf_from_string(
        StaticRender.render_erb(self.class.config[:template_path], {
          :@order => self.order,
          :@address => self.order.bill_address,
          :@invoice_print => self
        }), {
          :margin => config[:page_margins]
        }
      )
    end

  private

    def generate_invoice_number
      write_attribute(:invoice_number, config[:invoice_number_generation_method].call(InvoicePrint.from_current_year.length + 1))
    end

  end

  class StaticRender < ActionController::Base
    def self.render_erb(template_path, locals = {})
      view = ActionView::Base.new(ActionController::Base.view_paths, {})
      class << view
        include ApplicationHelper
        include WickedPdfHelper::Assets
        include Spree::BaseHelper
      end
      view.render(:file => template_path, :locals => locals, :layout => nil)
    end
  end

end
