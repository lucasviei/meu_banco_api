class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.references :from_account, null: false, foreign_key: { to_table: :bank_accounts }
      t.references :to_account, null: false, foreign_key: { to_table: :bank_accounts }
      t.decimal :amount

      t.timestamps
    end
  end
end
