class ItemWhTransacsController < ApplicationController
  before_action :set_item_wh_transac, only: [:show, :edit, :update, :destroy]
  before_action :get_reference_desti, only: [:new, :edit, :index]

  # GET /item_wh_transacs
  # GET /item_wh_transacs.json
  def index
    warehouse_filter = ItemWhTransac.all.where("warehouse_id=?",params[:warehouse_filter])
    item_filter = ItemWhTransac.all.where("item_id=?",params[:item_filter])
    transac_type_filter = ItemWhTransac.all.where("transac_type=?",params[:transac_type_filter])
    #transac_start = ItemWhTransac.all.where("transac_date >=?",params[:transac_start])
    #transac_start = ItemWhTransac.all.where("transac_date <=?",params[:transac_end])
    puts params[:transac_start].to_s + "----------------------------"
    @item_wh_transacs = ItemWhTransac.all
    @item_wh_transacs = @item_wh_transacs & warehouse_filter if params[:warehouse_filter].present?
    @item_wh_transacs = @item_wh_transacs & item_filter if params[:item_filter].present?
    @item_wh_transacs = @item_wh_transacs & transac_type_filter if params[:transac_type_filter].present?
    #@item_wh_transacs = @item_wh_transacs & transac_start if params[:transac_start].present?
    #@item_wh_transacs = @item_wh_transacs & transac_end if params[:transac_end].present?
  end

  # GET /item_wh_transacs/1
  # GET /item_wh_transacs/1.json
  def show
  end

  # GET /item_wh_transacs/new
  def new
    @item_wh_transac = ItemWhTransac.new
    
  end

  # GET /item_wh_transacs/1/edit
  def edit

  end

  # POST /item_wh_transacs
  # POST /item_wh_transacs.json
  def create
    @item_wh_transac = ItemWhTransac.new(item_wh_transac_params)

    respond_to do |format|
      if @item_wh_transac.save
        if @item_wh_transac.transac_type == "Stock Out" || @item_wh_transac.transac_type == "Usage" || @item_wh_transac.transac_type == "Initial"
          @item_wh_transac.reference_stockout_usage = nil
          if @item_wh_transac.amount > 0
            @item_wh_transac.amount = @item_wh_transac.amount * (-1)
          end
          @item_wh_transac.save
        end
        format.html { redirect_to @item_wh_transac, notice: 'Item wh transac was successfully created.' }
        format.json { render :show, status: :created, location: @item_wh_transac }
      else
        format.html { render :new }
        format.json { render json: @item_wh_transac.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /item_wh_transacs/1
  # PATCH/PUT /item_wh_transacs/1.json
  def update
    respond_to do |format|
      if @item_wh_transac.update(item_wh_transac_params)
        if @item_wh_transac.transac_type == "Stock Out" || @item_wh_transac.transac_type == "Usage" || @item_wh_transac.transac_type == "Initial"
          @item_wh_transac.reference_stockout_usage = nil
          if @item_wh_transac.amount > 0
            @item_wh_transac.amount = @item_wh_transac.amount * (-1)
          end
          @item_wh_transac.save
        end
        format.html { redirect_to @item_wh_transac, notice: 'Item wh transac was successfully updated.' }
        format.json { render :show, status: :ok, location: @item_wh_transac }
      else
        format.html { render :edit }
        format.json { render json: @item_wh_transac.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /item_wh_transacs/1
  # DELETE /item_wh_transacs/1.json
  def destroy
    @item_wh_transac.destroy
    respond_to do |format|
      format.html { redirect_to item_wh_transacs_url, notice: 'Item wh transac was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def get_reference_desti
      @warehouse = Warehouse.all
      @item = Item.all
      @all_usage_stockout = ItemWhTransac.all.where("transac_type=? OR transac_type=?","Stock Out","Usage")
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_item_wh_transac
      @item_wh_transac = ItemWhTransac.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_wh_transac_params
      params.require(:item_wh_transac).permit(:warehouse_id, :item_id, :transac_date, :amount, :transac_type, :reference_stockout_usage, :responsible_person, :price, :destination, :note)
    end
end
