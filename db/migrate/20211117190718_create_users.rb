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

    create_table :trocas do |t|
      t.integer :solicitante_id, foreign_key: true
      t.integer :solicitado_id, foreign_key: true
      t.belongs_to :produto
      t.boolean :aceite_solicitante
      t.boolean :aceite_solicitado
      t.timestamps
    end
  end
end
