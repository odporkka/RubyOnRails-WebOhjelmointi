class StylesController < ApplicationController
  before_action :set_style, only: [:show, :edit, :update, :destroy]

  def index
    @styles = Style.all
  end

  def new
  end

  def create
  end

  def destroy
  end

  def show
    @styles = Style.all
  end

  private
  def set_style
    @style = Style.find(params[:id])
  end
end