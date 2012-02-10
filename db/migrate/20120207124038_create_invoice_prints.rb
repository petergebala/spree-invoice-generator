class CreateInvoicePrints < ActiveRecord::Migration
  def change
    create_table :invoice_prints do |t|
      t.integer :order_id
      t.integer :user_id
      t.integer :counter

      t.timestamps
    end
  end
end
