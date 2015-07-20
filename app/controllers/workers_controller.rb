class WorkersController < ApplicationController

  before_action :set_worker, only: [:show, :edit, :update, :destroy]
  # GET /workers
  # GET /workers.json
  def index
    @workers = Worker.all
    respond_to do |format|
            format.html # index.html.erb
            format.xml  { render :xml => @workers }
          end
  end

  # GET /workers/1
  # GET /workers/1.json
  def show
    @worker = Worker.find(params[:id])

    	    respond_to do |format|
      	      format.html # show.html.erb
      	      format.xml  { render :xml => @worker }
      	    end
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
        format.html { redirect_to @worker, notice: 'Worker was successfully updated.' }
        format.json { render :show, status: :ok, location: @worker }
      else
        format.html { render :edit }
        format.json { render json: @worker.errors, status: :unprocessable_entity }
      end
    end
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
      @worker = Worker.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def worker_params
      params.require(:worker).permit(:name, :city, :subcity, :peramadd, :phoneno, :email, :service, :contractbasis, :status)
    end
end
