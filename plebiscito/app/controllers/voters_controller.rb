class VotersController < ApplicationController
	def create
    	@place = Place.find(params[:place_id])
    	@voter = @place.voters.create(voter_params)
    	@voter.ciudad = @place.ciudad.to_s
  		@voter.departamento = @place.departamento.to_s
    	redirect_to place_path(@place)
  	end

 	def new
 		@place = Place.find(params[:place_id])
 	end
  	private
    	def voter_params
      		params.require(:voter).permit(:cedula, :nombre, :ciudad, :departamento, :havotado)
    	end
end
