class SessionsController < ApplicationController
  def new
    # renderöi kirjautumissivun
  end

  def create
    user = User.find_by username: params[:username]
    if user && user.oauth_user == true
      if user.banned
        redirect_to :back, alert: "Your account has been frozen, please contact admin!"
      else
        session[:user_id] = user.id
        redirect_to user_path(user), notice: "Welcome back #{user.username}!"
      end
    else
      if user && user.authenticate(params[:password])
        if user.banned
          redirect_to :back, alert: "Your account has been frozen, please contact admin!"
        else
          session[:user_id] = user.id
          redirect_to user_path(user), notice: "Welcome back #{user.username}!"
        end
      else
        redirect_to :back, notice: "Username and/or password mismatch!"
      end
    end
  end

  def destroy
    # nollataan sessio
    session[:user_id] = nil
    # uudelleenohjataan sovellus pääsivulle
    redirect_to :root
  end

  def create_oauth
    info = env["omniauth.auth"].info
    username = info['nickname']
    user = User.where(["username = ?", username]).first
    params[:username] = username

    if user == nil
      user = User.new({:username => username, :oauth_user => true})
      user.save(validate: false)
      create
    else
      create
    end
  end
end