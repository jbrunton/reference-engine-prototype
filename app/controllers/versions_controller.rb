class VersionsController < ApplicationController
  def index
    @fact = Fact.find(params[:fact_id])
    @versions = @fact.versions.
        select{ |v| v.event != 'create' }.
        sort_by{ |v| v.created_at }.
        reverse
  end

  def show
    @version = PaperTrail::Version.find(params[:id])
    @fact = @version.reify
  end

  def restore
    @version = PaperTrail::Version.find(params[:id])
    @fact = @version.reify
    @fact.save
    redirect_to @fact
  end
end