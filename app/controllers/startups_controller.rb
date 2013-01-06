class StartupsController < ApplicationController
  before_filter :authenticate_user!, except: [:show]
  load_and_authorize_resource only: [:index, :update, :edit, :destroy]

  # GET /startups
  # GET /startups.json
  def index
    @startups = Startup.all

    respond_to do |format|
      format.html # index.html.erb
      #format.json { render json: @startups }
    end
  end

  # GET /startups/1
  # GET /startups/1.json
  def show
    @startup = Startup.find(params[:id])
    @update  = @startup.updates.build
    @startup_updates = Update.where(startup_id: @startup.id)

    respond_to do |format|
      format.html {
      	if request.path != startup_path(@startup)
    		redirect_to @startup, status: :moved_permanently
   		 end
   	   }
      #format.json { render json: @startup }
    end
  end

  # GET /startups/new
  # GET /startups/new.json
  def new
    @startup = Startup.new

    respond_to do |format|
      format.html # new.html.erb
      #format.json { render json: @startup }
    end
  end

  # GET /startups/1/edit
  def edit
    @startup = Startup.find(params[:id])
  end

  # POST /startups
  # POST /startups.json
  def create
    @startup = current_user.startups.build(params[:startup])
    
    respond_to do |format|
      if @startup.save
        format.html { redirect_to @startup, notice: 'Startup was successfully created.' }
        #format.json { render json: @startup, status: :created, location: @startup }
      else
        format.html { render action: "new" }
        #format.json { render json: @startup.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /startups/1
  # PUT /startups/1.json
  def update
    @startup = Startup.find(params[:id])

    respond_to do |format|
      if @startup.update_attributes(params[:startup])
        format.html { redirect_to @startup, notice: 'Startup was successfully updated.' }
        #format.json { head :no_content }
      else
        format.html { render action: "edit" }
        #format.json { render json: @startup.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /startups/1
  # DELETE /startups/1.json
  def destroy
    @startup = Startup.find(params[:id])
    @startup.destroy

    respond_to do |format|
      format.html { redirect_to root_path }
      #format.json { head :no_content }
    end
  end
end
