class CreateBankAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :bank_accounts do |t|
      t.decimal :valor_total
      t.string :numero_conta
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
