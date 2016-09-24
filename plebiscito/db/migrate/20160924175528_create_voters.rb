class CreateVoters < ActiveRecord::Migration
  def change
    create_table :voters do |t|
      t.string :cedula
      t.string :nombre
      t.string :ciudad
      t.string :departamento
      t.string :havotado
      t.references :place, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
