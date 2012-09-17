module Spree
  class InvoicePrintsController < Spree::BaseController

    def show
      order_id = params[:order_id].to_i
      @order = Order.find_by_id(order_id)
      @address = @order.bill_address
      @invoice_print = current_user.has_role?(:admin) ? InvoicePrint.find_or_create_by_order_id({:order_id => order_id, :user_id => @order ? @order.user_id : nil}) : current_user.invoice_prints.find_or_create_by_order_id(order_id)
      if @invoice_print
        respond_to do |format|
          format.pdf  { send_data @invoice_print.generate_pdf, :filename => "#{@invoice_print.invoice_number}.pdf", :type => 'application/pdf' }
          format.html { render :file => InvoicePrint.config[:template_path].to_s, :layout => false }
        end
      else
        if current_user.has_role?(:admin)
          return redirect_to(admin_orders_path, :notice => t(:no_such_order_found, :scope => :spree))
        else
          return redirect_to(orders_path, :alert => t(:no_such_order_found, :scope => :spree))
        end
      end
    end

  end
end
