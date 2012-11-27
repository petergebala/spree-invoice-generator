module Spree
  class InvoicePrintsController < Spree::BaseController
    before_filter :find_order

    def show
      # Assign address instance variable
      @address = @order.bill_address

      # Assing invoice_print instance variable depending on user privileges
      @invoice_print = if current_user.has_spree_role?(:admin) 
        InvoicePrint.find_or_create_by_order_id(order_id: @order, user_id: @order.user) 
      else
        current_user.invoice_prints.find_or_create_by_order_id(@order.id)
      end

      respond_to do |format|
        format.pdf do 
          render_options = { pdf: "#{@invoice_print.invoice_number}.pdf", layout: false }.merge(SpreeInvoiceGenerator.wkhtmltopdf_options)
          render render_options
        end
        format.html { render file: SpreeInvoiceGenerator.wkhtmltopdf_options[:template], layout: false }
      end
    end

    private
    def find_order
      begin
        @order = Order.find(params[:order_id])

      # Makes sure that this order exists in DB
      rescue ActiveRecord::RecordNotFound
        alert_message = t(:no_such_order_found, scope: :spree)

        if current_user.has_spree_role?(:admin)
          return redirect_to(admin_orders_path, alert: alert_message)
        else
          return redirect_to(orders_path, alert: alert_message)
        end
      end
    end
  end
end
