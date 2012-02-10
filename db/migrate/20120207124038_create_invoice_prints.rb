class CreateInvoicePrints < ActiveRecord::Migration
  def change
    create_table :spree_invoice_prints do |t|
      t.integer :order_id
      t.integer :user_id
      t.integer :counter, :default => 0

      t.timestamps
    end
  end
end
