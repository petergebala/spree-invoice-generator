Spree::Order.class_eval do
  has_one :invoice_print, :dependent => :destroy

  after_update :add_invoice_print

  private
  def add_invoice_print
  	# Only create an invoice if the order is completed!
  	# And only create it if there is no invoice yet.
    self.create_invoice_print(user: user) if self.completed? && self.invoice_print.blank?
  end
end
