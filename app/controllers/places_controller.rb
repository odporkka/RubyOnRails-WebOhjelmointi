require 'beermapping_api'

class PlacesController < ApplicationController
  before_action :set_places, only: [:show, :index]

  def index
      @last_city = session[:last_place_search]
      if @last_city
        @weather = BeermappingApi.fetch_weather(@last_city)
      end
  end

  def show
    @place = Place.new @places.select { |p| p.id == params[:id] }.first
    raise "MAP_APIKEY env variable not defined" if ENV['MAP_APIKEY'].nil?
    @map_key = ENV['MAP_APIKEY']
  end

  def search
    @places = BeermappingApi.places_in(params[:city])
    session[:last_place_search] = params[:city]
    if @places.empty?
      redirect_to places_path, notice: "No locations in #{params[:city]}"
    else
      render :index
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_places
    if session[:last_place_search]
      @places = BeermappingApi.places_in(session[:last_place_search])
    end
  end
end