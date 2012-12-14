class PagesController < ApplicationController
  def home
    @startups = Startup.all
  end
end
