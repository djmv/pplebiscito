class VotersController < ApplicationController
	def create
    	@place = Place.find(params[:place_id])
    	@voter = @place.voters.create(voter_params)
    	@voter.ciudad = @place.ciudad
  		@voter.departamento = @place.departamento
  		@voter.havotado = "false"
    	redirect_to place_voters_path(@place)
  	end
  	def index
		@voters = Voter.all
		@place = Place.find(params[:place_id])
	end

 	def new
 		@place = Place.find(params[:place_id])
 	end
  	private
    	def voter_params
      		params.require(:voter).permit(:cedula, :nombre, :ciudad, :departamento, :havotado)
    	end
end