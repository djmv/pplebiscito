class VotersController < ApplicationController
	def create
    	@place = Place.find(params[:place_id])
    	@voter = @place.voters.create(voter_params)
    	redirect_to place_path(@place)
  	end
 	def new
 	end
  	private
    	def voter_params
      		params.require(:voter).permit(:cedula, :nombre, :ciudad, :departamento, :havotado)
    	end
end
