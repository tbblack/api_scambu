class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :cpf

      t.timestamps
    end

    create_table :produtos do |t|
      t.string :name
      t.string :descricao
      t.integer :quantidade
      t.belongs_to :user

      t.timestamps
    end
  end
end
