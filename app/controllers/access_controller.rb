class AccessController < ApplicationController
  
  layout 'admin'

  before_action :confirm_logged_in, :except => [:login, :attempt_login, :logout]

  def menu
    # byebug
  end

  def login
  end

  def attempt_login
    if params[:email].present? && params[:password].present?
      found_user = User.where(:email => params[:email]).first
      if found_user 
        authorized_user = found_user.authenticate(params[:password])
      end
    end
  
    if authorized_user
      session[:user_id] = authorized_user.id
      session[:user_first_name] = authorized_user.first_name
      flash[:notice] = "You are now logged in, good job"
      redirect_to(admin_path)
    else
      flash.now[:notice] = "Invalid username/password combination"
      render('login')
    end
    
  end

  def logout
    session[:user_id] = nil
    redirect_to(access_login_path)
  end

  def register
    @users = User.new
  end

  private

  def confirm_logged_in
    unless session[:user_id]
      flash[:notice] = "Please log in first"
      redirect_to(access_login_path)
    end
  end


end
