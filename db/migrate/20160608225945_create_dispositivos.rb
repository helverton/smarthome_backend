class CreateDispositivos < ActiveRecord::Migration
  def change
    create_table :dispositivos do |t|
      t.string :nome
      t.string :descricao
      t.string :tipo
      t.integer :situacao

      t.timestamps null: false
    end
  end
end
