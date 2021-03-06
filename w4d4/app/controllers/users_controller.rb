class UsersController < ApplicationController

  before_action :require_user_to_not_be_signed_in!, only: [:new]
  before_action :require_user_to_be_signed_in!, only: [:show]

  def create
    @user = User.new(user_params)
    if @user.save
      log_in_user!(@user)
      redirect_to user_url(@user)
    else
      flash.now[:errors] = ["Invalid email and/or password"]
      render :new
    end
  end

  def new
    @user = User.new
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end

  def show
    @user = User.find_by_id(params[:id])
  end

end
