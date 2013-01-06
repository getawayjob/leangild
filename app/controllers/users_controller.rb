class UsersController < ApplicationController
  def index
  	 authorize! :index, @user
  	 @users = User.all
  end

  def show
  	@user = User.find(params[:id])
  	@users_startups = @user.users_startups
  end
end
