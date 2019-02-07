class CreatePaymentAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :payment_accounts do |t|
      t.references :user, foreign_key: true
      t.decimal :balance

      t.timestamps
    end
  end
end
