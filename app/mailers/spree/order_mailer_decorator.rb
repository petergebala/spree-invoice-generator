module Spree
  OrderMailer.class_eval do

    # TODO
    # - refractor this shit
    def confirm_email(order, resend = false)
      if InvoicePrint.config[:on_confirm_email] && !InvoicePrint.config[:except_payment].include?(order.payment_method.type)
        inv_print = InvoicePrint.find_or_create_by_order_id({:order_id => order.id, :user_id => order.user_id})
        attachments["#{inv_print.invoice_number}.pdf"] = {
          :content => inv_print.generate_pdf,
          :mime_type => 'application/pdf'
        } if inv_print
      end
      @order = order
      subject = (resend ? "[#{t(:resend).upcase}] " : "")
      subject += "#{Config[:site_name]} #{t('order_mailer.confirm_email.subject')} ##{order.number}"
      mail(:to => order.email, :subject => subject)
    end

  end
end
