class PagesController < ApplicationController
	before_filter :authenticate_user!, only: [:dashboard, :activity]
	
  def home
    @startups = Startup.all

    respond_to do|format|
      format.html
    end
  end

  def dashboard

  end

  def activity
  	
  end

  def hashgild
  	
  end
end
