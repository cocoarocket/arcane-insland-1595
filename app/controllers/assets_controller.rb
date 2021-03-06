class AssetsController < ApplicationController
  #before_action :set_asset, only: [:show, :edit, :update, :destroy]

	add_breadcrumb "home", :root_path

  def index
    #@assets = Asset.where(:sm_content_id => params[:sm_content_id])
		#@smc = SmContent.find(params[:sm_content_id])
  end

  def show
	  #@smc = SmContent.find(params[:id])
	  #@assets = Asset.where(:sm_content_id => @smc.id)

	  @smc = SmContent.find(params[:sm_content_id])
	  @assets = @smc.assets

	  add_breadcrumb @smc.submenu.sname, submenu_path(:id => @smc.submenu.id)
	  add_breadcrumb @smc.title, sm_content_path(:id => @smc.id)
	  add_breadcrumb "Deleting files"
  end

  # GET /assets/1/edit
  def edit
	  #@smc = SmContent.find(params[:id])
	  #@assets = Asset.where(:sm_content_id => @smc.id)

	  #@smc = SmContent.find(params[:sm_content_id])
	  #@assets = @smc.assets
  end

  # PATCH/PUT /assets/1
  # PATCH/PUT /assets/1.json
  def update
    #respond_to do |format|
    #  if @asset.update(asset_params)
    #    format.html { redirect_to @asset, notice: 'Asset was successfully updated.' }
    #    format.json { head :no_content }
    #  else
    #    format.html { render action: 'edit' }
    #    format.json { render json: @asset.errors, status: :unprocessable_entity }
    #  end
    #end
  end

  # DELETE /assets/1
  # DELETE /assets/1.json
  def destroy
		@asset = Asset.where(params[:destroy])
    @asset.destroy_all
    respond_to do |format|
      format.html { redirect_to sm_content_path(params[:sm_content_id]) }
      format.json { head :no_content }
    end
  end

  def new
	  @sm_content = SmContent.find(params[:sm_content_id])
	  @sm_content.assets.build

	  add_breadcrumb @sm_content.submenu.sname, submenu_path(:id => @sm_content.submenu.id)
	  add_breadcrumb @sm_content.title, sm_content_path(:id => @sm_content.id)
	  add_breadcrumb "Adding files"

	  respond_to do |format|
		  format.html # new.html.erb
		  format.json { render json: @asset }
	  end

  end

  # POST /assets
  # POST /assets.json
  def create
	  #@asset = Asset.new(params.require(:asset).permit(assets: [:asset))#(asset_params)
	  #@asset = Asset.new(_params.permit([:asset]))#(asset_params)
	  #@smc = SmContent.find(params[:sm_content_id])


	  #@smc = SmContent.find(asset_params)
	  #@smc.assets.build

	  #params[:asset][:assets].each do |file|
		#  @asset = Asset.new(file)
		#  @asset.save
	  #end

	  respond_to do |format|
		  if @asset.save
			  format.html { redirect_to @smc, notice: 'Asset was successfully created.' }
			  format.json { render action: 'show', status: :created, location: @asset }
		  else
			  format.html { render action: 'new' }
			  format.json { render json: @asset.errors, status: :unprocessable_entity }
		  end
	  end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def asset_params_
	  #params.require(:sm_content).permit(:title, :content, :sm_content_id, :assets)
	  #params.require(:asset).permit(:sm_content_id, asset:[])
		params.require(:sm_content).permit(:asset => [])
		#params.permit([:asset])
	  #params[:assets]
	  #params[:assets_attributes]
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_asset
	  @asset = Asset.find(params[:id])
  end

	def sm_content_id
		params.require(:sm_content).permit(:sm_content_id)
	end
end
