class InvitationsController < ApplicationController
 	before_filter :authenticate_user!

 	def create
	 	 @startup = Startup.find(params[:invitation][:startup_id])
	 	 current_user.request_invite!(@startup)
	 	 redirect_to @startup
 	end

 	def destroy
 		@startup = Invitation.find(params[:id]).startup
 		current_user.cancel_request!(@startup)
 		redirect_to @startup
 	end
  end