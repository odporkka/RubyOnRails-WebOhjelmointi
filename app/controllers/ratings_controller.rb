class RatingsController < ApplicationController
  def index
    @ratings = Rating.all
    @recent = Rating.recent
    @most_active = User.top3active
    @top3beers = Beer.top(2)
    @top3breweries = Brewery.top(2)
    @top3styles = Style.top(2)
  end

  def new
    @rating = Rating.new
    @beers = Beer.all
  end

  def create
    @rating = Rating.create params.require(:rating).permit(:score, :beer_id)
    if current_user.nil?
      redirect_to signin_path, notice:'you should be signed in'
    elsif @rating.save
      current_user.ratings << @rating
      redirect_to user_path current_user
    else
      @beers = Beer.all
      render :new
    end
  end

  def destroy
    rating = Rating.find params[:id]
    rating.delete if current_user == rating.user
    redirect_to :back
  end
end