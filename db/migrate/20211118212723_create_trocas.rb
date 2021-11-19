class CreateTrocas < ActiveRecord::Migration[6.1]
  def change
    create_table :trocas do |t|
      t.integer :solicitante_id, foreign_key: true
      t.integer :solicitado_id, foreign_key: true
      t.integer :produto_id
      t.boolean :aceite_solicitante
      t.boolean :aceite_solicitado
      t.timestamps
    end
  end
end
