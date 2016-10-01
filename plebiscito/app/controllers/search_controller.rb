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
    @i = 1
    #@places = Place.find(params[:place_id])
    #@place = Place.find(@v)

    respond_to do |format|
      format.html { redirect_to "/main/hola" }
      format.json {  render json: @voter}
      format.js 
    end
  end
  def ucreate
    palabra = "%#{params[:keyword]}%"

    @voter = Voter.select("nombre").where("cedula LIKE ? AND place_id LIKE ?",palabra,1)
    puts @voter
    @i = 2

    respond_to do |format|
      format.html { redirect_to "/main/votar" }
      format.json {  render json: @voter}
      format.js 
    end
  end
end
