class UsersController < ApplicationController
  include SessionsHelper
  before_action :correct_user,   only: [:show]
  
  def show
    @user = User.find(params[:id])
    @locations = @user.locations
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:name, :email, :password, :password_confirmation))

    if @user.save
      redirect_to login_url
    else
      render 'new'
    end
  end
 

  private
    def logged_in_user
      unless logged_in?
        redirect_to login_url
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
end
