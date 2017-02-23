class StylesController < ApplicationController
  before_action :set_style, only: [:show, :edit, :update, :destroy]
  before_action :ensure_that_admin, only: [:edit, :update, :destroy, :new]

  def index
    @styles = Style.all.order(:name)
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