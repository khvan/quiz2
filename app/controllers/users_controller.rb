class UsersController < ApplicationController
  def index
  end

  def show
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save 
      flash[:notice] = "Sign up successful"
      redirect_to(admin_path)
    else
      render('new')
    end


  end

  def edit
  end

  def delete
  end
  
  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password_digest, :password)
  end

  def confirm_logged_in
    unless session[:user_id]
      flash[:notice] = "Please log in first"
      redirect_to(access_login_path)
    end
  end

end
