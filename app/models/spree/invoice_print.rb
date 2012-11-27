module Spree
  class InvoicePrint < ActiveRecord::Base
    # Attributes
    attr_accessible :user

    # Relations
    belongs_to :user
    belongs_to :order

    # Scopes
    scope :from_current_year, where(["created_at > ? AND created_at < ?", Time.now.at_beginning_of_year, Time.now.at_end_of_year])

    def generate_pdf
      self.update_attribute(:counter, self.counter + 1)
      # TODO
      # - Move it to controller. Do not genenrate html in model. This is wrong place to do that
      WickedPdf.new.pdf_from_string(
        StaticRender.render_erb(SpreeInvoiceGenerator.wkhtmltopdf_options[:template], {
          :@order => self.order,
          :@address => self.order.bill_address,
          :@invoice_print => self
        }), 
        SpreeInvoiceGenerator.wkhtmltopdf_options
      )
    end
  end

  # TODO
  # Crap....
  class StaticRender < ActionController::Base
    def self.render_erb(template_path, locals = {})
      view = ActionView::Base.new(ActionController::Base.view_paths, {})
      class << view
        include ApplicationHelper
        include WickedPdfHelper::Assets
        include Spree::BaseHelper
      end
      view.render(file: template_path, locals: locals, layout: nil)
    end
  end
end
