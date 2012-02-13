Spree::OrderMailer.class_eval do

  def confirm_email(order, resend=false)
    if !Spree::InvoicePrint.config[:except_payment].include?(order.payment_method.type)
      inv_print = Spree::InvoicePrint.find_by_order_id(order.id)
      attachments["invoice.pdf"] = {:content => inv_print.generate_pdf,
                                  :mime_type => 'application/pdf' } if inv_print
    end

    @order = order
    subject = (resend ? "[#{t(:resend).upcase}] " : "")
    subject += "#{Spree::Config[:site_name]} #{t('order_mailer.confirm_email.subject')} ##{order.number}"
    mail(:to => order.email, :subject => subject)
  end
end
