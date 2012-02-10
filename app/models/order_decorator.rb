Spree::Order.class_eval do
  has_one :invoice_print
  after_create :add_invoice_print

  private
  def add_invoice_print
    InvoicePrint.create(:order => self, :user => self.user)
  end
end
