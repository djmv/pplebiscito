class SearchController < ApplicationController
  def create
  	palabra = "%#{params[:keyword]}%"
  	@places = Place.where("nombre LIKE ? OR ciudad LIKE ?",palabra,palabra)

  	respond_to do |format|
  		format.html { redirect_to "/main/index" }
  		format.json {  render json: @places }
  		format.js 
  	end
  end

end
