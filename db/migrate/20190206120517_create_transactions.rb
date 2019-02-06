class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.string :description
      t.references :user_to
      t.references :user_from
      t.decimal :amount

      t.timestamps
    end
  end
end
