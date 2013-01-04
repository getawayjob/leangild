class PagesController < ApplicationController
	before_filter :authenticate_user!, except: [:hashgild, :home]
		
  def home
    @startups = Startup.all

    respond_to do|format|
      format.html
    end
  end

  def dashboard

  end

  def activity
  	@user = current_user
  	@startup_updates = Update.all
  end

  def hashgild
  	
  end
end
