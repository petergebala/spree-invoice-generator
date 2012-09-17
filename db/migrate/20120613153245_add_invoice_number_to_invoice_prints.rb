class AddInvoiceNumberToInvoicePrints < ActiveRecord::Migration
  def change
    add_column :spree_invoice_prints, :invoice_number, :string
    add_index :spree_invoice_prints, :invoice_number
  end
end
