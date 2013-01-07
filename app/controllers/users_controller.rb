class UsersController < ApplicationController
  def index
  	 authorize! :index, @user
  	 @users = User.all
  end

  def show
  	@user = User.find(params[:id])
  	@users_startups = @user.startups
  	@requested_startups = @user.requested_startups
  end
end
