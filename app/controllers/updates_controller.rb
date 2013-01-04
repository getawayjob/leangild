class UpdatesController < ApplicationController
	before_filter :authenticate_user!
	load_and_authorize_resource
	
  # POST /updates
  # POST /updates.json
  def create
    @update = Update.new(params[:update])

    respond_to do |format|
      if @update.save
        format.html { redirect_to :back, notice: 'Progress updated successfully.' }
        format.js
       else
       	format.html { redirect_to :back }
        flash[:error] = 'Could not create update'
      end
    end
  end

  # DELETE /updates/1
  # DELETE /updates/1.json
  def destroy
    @update = Update.find(params[:id])
    @update.destroy

    respond_to do |format|
      format.html { redirect_to :back }
    end
  end
end
