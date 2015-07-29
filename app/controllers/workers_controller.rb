class WorkersController < ApplicationController

  before_action :set_worker, only: [:show, :edit, :update, :destroy]
  # GET /workers
  # GET /workers.json
  def index
    @workers = Worker.all
    @worker = Worker.new
    @services=Service.all
    @cities=City.all
    respond_to do |format|
            format.html # index.html.erb
            format.xml  { render :xml => @workers }
          end
  end

  # GET /workers/1
  # GET /workers/1.json
  def show

  end

  # GET /workers/new
  def new
    @worker = Worker.new
        respond_to do |format|
      	      format.html # new.html.erb
      	      format.xml  { render :xml => @worker }
          end
  end

  # GET /workers/1/edit
  def edit
    @worker=Worker.find(params[:id])
  end

  # POST /workers
  # POST /workers.json
  def create
    @worker = Worker.new(worker_params)
    @city =City.find(params[:worker][:city])

    @worker.city=@city.cityName
    respond_to do |format|
      if @worker.save
        format.html { redirect_to @worker, notice: 'Worker was successfully created.' }
        format.json { render :show, status: :created, location: @worker }
      else
        format.html { render :new }
        format.json { render json: @worker.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /workers/1
  # PATCH/PUT /workers/1.json
  def update
    respond_to do |format|
      if @worker.update(worker_params)
        format.html {redirect_to (:back), notice: 'Worker was successfully updated.' }
        format.json { render :show, status:  :ok, location: @worker }
      else
        format.html { render :edit }
        format.json { render json: @worker.errors, status: :unprocessable_entity }
      end
    end
  end

  def details
    @worker = Worker.find(params[:worker_id])
  end

  # DELETE /workers/1
  # DELETE /workers/1.json
  def destroy
    @worker.destroy
    respond_to do |format|
      format.html { redirect_to workers_url, notice: 'Worker was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_worker
      @services=Service.all
      @cities=City.all
      @worker = Worker.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def worker_params
      params.require(:worker).permit(:name, :city, :servicename,:subcity, :peramadd, :phoneno, :email, :contractbasis, :status)
    end
end
