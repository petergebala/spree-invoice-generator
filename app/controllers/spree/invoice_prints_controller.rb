module Spree
  class InvoicePrintsController < Spree::BaseController
    def get_pdf
      order_id = params[:order_id].to_i

      unless order_id.zero?
        @order = InvoicePrint.find_by_order_id(order_id) 
        render :text => "#{@order.id} is ok"
      else
        if user.has_role?(:admin)
          redirect_to admin_orders_path, :alert => "There is no such a order."
        else
          redirect_to orders_path, :alert => "There is no such a order."
        end
      end
    end
  end
end
