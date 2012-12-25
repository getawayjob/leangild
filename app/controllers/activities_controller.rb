class ActivitiesController < ApplicationController
  def activity
  	@activities = PublicActivity::Activity.order("created_at DESC").all

  	respond_to do |format|
  	  format.html
  	end
  end
end