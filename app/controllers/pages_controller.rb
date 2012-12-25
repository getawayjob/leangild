class PagesController < ApplicationController
  def home
    @startups = Startup.all

    respond_to do|format|
      format.html
    end
  end
end
