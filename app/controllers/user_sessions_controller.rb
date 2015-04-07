class UserSessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:username_or_email])
    if user.nil?
      user = User.find_by(email: params[:username_or_email])
    end
    #authorized_user = User.authenticate(params[:username_or_email],params[:login_password])
    if user && user.password === params[:login_password]
      session[:user_id] = user.id
      session[:username] = user.username
      flash[:success] = "Thanks for logging in!"
      redirect_to root_url
    else
      flash[:error] = "There was a problem logging in. Please check your email and password!"
      render action: 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    session[:username] = nil
    flash[:notice] = "Successfully logged out."
    redirect_to root_url
  end


end
