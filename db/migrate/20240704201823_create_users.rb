class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :nome_completo
      t.string :email
      t.string :cpf

      t.timestamps
    end
  end
end
