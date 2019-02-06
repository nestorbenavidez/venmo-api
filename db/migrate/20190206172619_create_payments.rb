class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.string :description
      t.integer :user_to
      t.integer :user_from
      t.decimal :amount

      t.timestamps
    end
  end
end
