class FactsController < ApplicationController
  before_action :set_fact, only: [:show, :edit, :update, :destroy, :versions, :restore_version]

  # GET /facts/1
  # GET /facts/1.json
  def show
  end

  # GET /facts/new
  def new
    @fact = Fact.new
  end

  # GET /facts/1/edit
  def edit
    @fact.version_description = nil
  end

  # POST /facts
  # POST /facts.json
  def create
    @fact = Fact.new(fact_params)

    respond_to do |format|
      if @fact.save
        format.html { redirect_to @fact, notice: 'Fact was successfully created.' }
        format.json { render :show, status: :created, location: @fact }
      else
        format.html { render :new }
        format.json { render json: @fact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /facts/1
  # PATCH/PUT /facts/1.json
  def update
    respond_to do |format|
      if @fact.update(fact_params)
        @fact.categorize()
        format.html { redirect_to @fact, notice: 'Fact was successfully updated.' }
        format.json { render :show, status: :ok, location: @fact }
      else
        format.html { render :edit }
        format.json { render json: @fact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /facts/1
  # DELETE /facts/1.json
  def destroy
    @fact.destroy
    respond_to do |format|
      format.html { redirect_to root_url, notice: 'Fact was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fact
      @fact = Fact.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      version = PaperTrail::Version.where(event: 'destroy', item_type: 'Fact', item_id: params[:id]).first
      if version
        version_link = view_context.link_to("here", version_path(version))
        redirect_to root_url, notice: "Page was deleted. View the last version #{version_link}."
      else
        raise ActiveRecord::RecordNotFound if version.nil?
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fact_params
      params.require(:fact).permit(:summary, :content, :version_description)
    end

    def categories_param
      params.require(:fact).permit(:categories)
    end

    def references_param
      params.require(:fact).permit(:references)
    end
end
