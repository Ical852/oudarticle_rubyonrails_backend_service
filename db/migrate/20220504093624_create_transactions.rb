class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.string :order_id
      t.string :gross_amount
      t.string :payment_url

      t.timestamps
    end
  end
end
