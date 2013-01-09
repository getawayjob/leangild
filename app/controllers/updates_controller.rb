class UpdatesController < ApplicationController
	before_filter :authenticate_user!
	
  # POST /updates
  # POST /updates.json
  def create
    @update = Update.new(params[:update])

    respond_to do |format|
      if @update.save
        format.html { redirect_to :back, notice: 'Progress updated successfully.' }
       else
       	format.html { redirect_to :back }
        flash[:error] = 'Could not post progress.'
      end
    end
  end

  # DELETE /updates/1
  # DELETE /updates/1.json
  def destroy
    @update = Update.find(params[:id])
    @update.destroy

    respond_to do |format|
      format.html { redirect_to :back, notice: 'Progress deleted successfully.' }
    end
  end

  def vote
  	value = params[:type] == "approve" ? 1 : -1
  	@update = Update.find(params[:id])
  	@update.add_or_update_evaluation(:update_votes, value, current_user)
  	redirect_to :back, notice: "Thank you for your feedback."
  end
end