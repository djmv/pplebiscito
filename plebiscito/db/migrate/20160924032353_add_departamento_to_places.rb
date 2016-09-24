class AddDepartamentoToPlaces < ActiveRecord::Migration
  def change
    add_column :places, :departamento, :string
  end
end