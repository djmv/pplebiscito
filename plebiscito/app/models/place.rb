class Place < ActiveRecord::Base
	validates :nombre,:ciudad, :direccion , :departamento, :presence => true
	validates :nombre, {:uniqueness => true}
end
