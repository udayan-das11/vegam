class ContractorsController < ApplicationController
  def index
    @contractor = Contractor.all
  end


  def new
    @contractor = Contractor.new
  end

  def create
    @contractor = Contractor.new params[:post]
    if @contractor.save
     # redirect_to posts_path
    else
      render :action => 'new'
    end
  end

  def edit
    @contractor = Contractor.find params[:id]
  end

  def update
    @contractor = Contractor.find params[:id]
    if @contractor.update_attributes params[:post]
      redirect_to posts_path
    else
      render :action => :edit
    end
  end

  def destroy
    @contractor = Contractor.find params[:id]
    @contractor.destroy
    #redirect_to posts_path
  end

  def show
    @contractor = Contractor.find params[:id]
  end

end
