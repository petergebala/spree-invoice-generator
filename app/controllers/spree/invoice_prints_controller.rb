module Spree
  class InvoicePrintsController < Spree::BaseController
    def get_pdf
      generate(params[:order_id])
    end

    private
    def generate(order)
      order_id = params[:order_id].to_i
      @invoice_print = current_user.has_role?(:admin) ? InvoicePrint.find_by_order_id(order_id) : current_user.orders.find_by_order_id(order_id)
      if @invoice_print
        respond_to do |format|
          format.pdf { send_data @invoice_print.generate_pdf, :filename => "invoice_#{@invoice_print.order_id}.pdf", :type => 'application/pdf' }
        end
      else
        if current_user.has_role?(:admin)
          return redirect_to(admin_orders_path, :notice => "There is no such an order.")
        else
          return redirect_to(orders_path, :alert => "There is no such an order.")
        end
      end
    end
  end
end
