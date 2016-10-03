class SearchController < ApplicationController
  def create
  	palabra = "%#{params[:keyword]}%"
  	@places = Place.where("nombre LIKE ? OR ciudad LIKE ?",palabra,palabra)
  	#@voters = Voter.where("cedula LIKE ?",palabra,palabra)

  	respond_to do |format|
  		format.html { redirect_to "/main/index" }
  		format.json {  render json: @places}
  		format.js 
  	end
  end
  def ocreate
    palabra = "%#{params[:keyword]}%"
    #@places = Place.where("nombre LIKE ? OR ciudad LIKE ?",palabra,palabra)
    #@v = Voter.select("id").where("cedula LIKE ?",palabra)
    @voter = Voter.select("place_id,nombre").where("cedula LIKE ?",palabra)
    #@places = Place.find(params[:place_id])
    #@place = Place.find(@v)

    respond_to do |format|
      format.html { redirect_to "/main/hola" }
      format.json {  render json: @voter}
      format.js 
    end
  end
  def vcreate
    palabra = "%#{params[:keyword]}%"
    @place = Place.find(params[:format])
    @pi=@place[:id].to_s
    @voter = Voter.where("cedula = ? and place_id = "+@pi,palabra)

    if Voter.exists?(["cedula = ? and place_id = "+@pi,palabra])
      redirect_to place_voter_votar_url(@place,@voter)   
    else
      redirect_to place_voter_notfound_url(@place,:keyword)
    end
  end
end
