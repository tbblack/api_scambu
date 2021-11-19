class CreateTrocas < ActiveRecord::Migration[6.1]
  def change
    create_table :trocas do |t|
      t.integer :id_solicitante
      t.integer :id_solicitado
      t.integer :id_produto
      t.boolean :aceite_solicitante
      t.boolean :aceite_solicitado
      t.timestamps
    end
  end
end
