module Spree
  class InvoicePrintsController < Spree::BaseController
    def get_pdf
      order_id = params[:order_id].to_i

      unless order_id.zero?
        @invoice_print = InvoicePrint.find_by_order_id(order_id) 
        respond_to do |format|
          format.html { render :text => "#{@invoice_print.id} is ok" }
          format.pdf { send_data @invoice_print.generate_pdf, :filename => "invoice_#{@invoice_print.order_id}.pdf", :type => 'application/pdf' }
        end
      else
        if user.has_role?(:admin)
          return redirect_to(admin_orders_path, :alert => "There is no such a order.")
        else
          return redirect_to(orders_path, :alert => "There is no such a order.")
        end
      end
    end
  end
end
