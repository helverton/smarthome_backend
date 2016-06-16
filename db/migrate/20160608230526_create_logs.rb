class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.string :situacao
      t.references :dispositivo, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
