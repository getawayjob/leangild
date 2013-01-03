class InvitationsController < ApplicationController
 	before_filter :authenticate_user!
 	load_and_authorize_resource :only => [:bulk_invite]

 	def create
	  	@startup = Startup.find(params[:invitation][:startup_id])
	  	current_user.request_invite!(@startup)
	  	respond_to do |format|
	  		format.html { redirect_to @startup }
	  		format.js
	  end
 	end

 	def destroy
	  	@startup = Invitation.find(params[:id]).startup
	  	current_user.cancel_request!(@startup)
	  	respond_to do |format|
	  	format.html { redirect_to @startup }
	  	format.js
	  end
 	end

 	def bulk_invite
 		@startup = Startup.find(params[:invitation][:startup_id])
 		invitations = @startup.invitations.where(:invite_token => nil).order(:created_at).limit(params[:quantity])
 		total = invitations.count
 		if invitations.any?
 			invitations.each do |invitation|
      invitation.send_invitation
	 end
	 redirect_to :back, :only_path => true, :notice => "#{total} new invitation(s) sent to users."
   else
   	 redirect_to :back, :only_path => true, :notice => "No new invitations sent."
  end
 end
end