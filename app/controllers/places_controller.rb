require 'beermapping_api'

class PlacesController < ApplicationController
  before_action :set_places, only: [:show, :index]
  before_action :set_weather, only: [:show, :index]

  def index
  end

  def show
    @place = Place.new @places.select { |p| p.id == params[:id] }.first
    raise "MAP_APIKEY env variable not defined" if ENV['MAP_APIKEY'].nil?
    @map_key = ENV['MAP_APIKEY']
  end

  def search
    session[:last_place_search] = params[:city]
    set_places
    if @places.empty?
      redirect_to places_path, notice: "No locations in #{params[:city]}"
    else
      redirect_to places_path
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_places
    if session[:last_place_search]
      @places = BeermappingApi.places_in(session[:last_place_search])
    end
  end

  def set_weather
    if session[:last_place_search]
      @weather = BeermappingApi.fetch_weather(session[:last_place_search])
    else
      @weather = []
    end
  end
end